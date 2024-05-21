import 'package:farm_guard/repository/model/response/get_history_response.dart';
import 'package:farm_guard/repository/record_repository.dart';
import 'package:farm_guard/utils/preferences/app_preferences.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final recordRepository = RecordRepository();
  final appPreferences = AppPreferences();

  RxString name = "".obs;

  RxList<HistoryData> historyList = <HistoryData>[].obs;

  RxBool isLoadingRecordData = false.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  void initData() async {
    await getRecordHistory();
    await getUserData();
  }

  Future getUserData() async {
    final user = await appPreferences.getUser();
    if (user != null) {
      name.value = user.name;
    }
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
        historyList.addAll(success.data.where((element) => element.typeHealth != "Kelas Tidak ditemukan"));
        isLoadingRecordData.value = false;
        print(historyList);
      },
    );
  }
}
