import 'dart:io';

import 'package:farm_guard/pages/Home/hasil_gambar.dart';
import 'package:farm_guard/repository/classification_repository.dart';
import 'package:farm_guard/repository/record_repository.dart';
import 'package:farm_guard/utils/dialog/custom_snackbar.dart';
import 'package:farm_guard/utils/dialog/loading_utils.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CheckImageController extends GetxController {
  final classificationRepository = ClassificationRepository();
  final recordRepository = RecordRepository();

  final imageFile = Rxn<File>();
  final _picker = ImagePicker();

  RxBool isPickedImage = false.obs;

  Future<void> getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    if (pickedFile != null) {
      isPickedImage.value = true;
      imageFile.value = File(pickedFile.path.toString());
      classifyingImage();
    } else {
      print('No image selected.');
    }
  }

  Future<void> getImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    if (pickedFile != null) {
      isPickedImage.value = true;
      imageFile.value = File(pickedFile.path.toString());
      classifyingImage();
    } else {
      print('No image selected.');
    }
  }

  Future<void> classifyingImage() async {
    LoadingUtils.showLoading();
    if (isPickedImage.value) {
      final response =
          await classificationRepository.classifiyingImage(imageFile.value!);
      response.fold(
        (failure) {
          LoadingUtils.hideLoader();
          CustomSnackbar.errorMessage("Informasi", failure.meta.message);
          print(failure.meta.message);
        },
        (success) async {
          final uploadResponse = await recordRepository
              .uploadHealthRecordResponse(success.assumption, imageFile.value!, success.akurasi);
          uploadResponse.fold(
            (failure) {
              LoadingUtils.hideLoader();
            },
            (uploadSuccess) {
              LoadingUtils.hideLoader();
              CustomSnackbar.successMessage("Informasi", "Berhasil");
              Get.toNamed(hasil_gambar.routeName, arguments: {
                "file_path": imageFile.value?.path,
                "result": success.assumption,
                "note" : success.note,
                "accuration": success.akurasi
              });
            },
          );
        },
      );
    } else {
      CustomSnackbar.warningMessage(
          "Informasi", "Pilih gambar terlebih dahulu");
    }
  }
}
