import 'package:farm_guard/repository/auth_repository.dart';
import 'package:farm_guard/repository/model/response/get_history_response.dart';
import 'package:farm_guard/repository/model/response/login_response.dart';
import 'package:farm_guard/repository/record_repository.dart';
import 'package:farm_guard/utils/preferences/app_preferences.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final recordRepository = RecordRepository();
  final appPreferences = AppPreferences();

  RxString name = "".obs;
  RxString image = "".obs;

  RxList<HistoryData> historyList = <HistoryData>[].obs;

  RxBool isLoadingRecordData = false.obs;

  @override
  void onInit() async {
    super.onInit();
    initData();
  }

  void initData() async {
    await getProfile();
    await getRecordHistory();
  }

  Future getProfile() async {
    final response = await AuthRepository().getProfile();

    image.value = response.photo;
    name.value = response.name;

    print("IMAGE VALUE = $image");

    await AppPreferences().setUser(User(
        id: response.id,
        name: response.name,
        email: response.email,
        phone: response.photo,
        birthdate: response.birthdate,
        gender: response.gender,
        photo: response.photo));
  }

  Future getRecordHistory() async {
    historyList.clear();
    isLoadingRecordData.value = true;

    final response = await recordRepository.getRecordHistory();

    response.fold(
      (failure) {
        isLoadingRecordData.value = false;
      },
      (success) {
        historyList.addAll(success.data
            .where((element) => element.typeHealth != "Kelas Tidak ditemukan"));
        isLoadingRecordData.value = false;
        print(historyList);
      },
    );
  }
}
