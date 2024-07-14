import 'package:absent_payroll/src/api/get_history_presence_api.dart';
import 'package:absent_payroll/src/core/base_import.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class HistoryController extends BaseController {
  var mainScrollController = ScrollController();
  List<Presence?> absentList = [];

  EasyRefreshController refreshController = EasyRefreshController();

  String? selectedMonth;
  List<String> monthList = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];

  String teacherId = '';

  bool isLoadingHistory = false;

  listData({int? pageTo}) async {
    getDosenListData();
  }

  @override
  onInit() {
    isLoading = true;
    update();
    super.onInit();
  }

  @override
  onReady() async {
    await getDosenListData();
    isLoading = false;
    update();
    super.onReady();
  }

  @override
  onClose() async {
    super.onClose();
  }

  getStatusText(String status) {
    switch (status) {
      case "approved":
        return "Disetujui";
    }
  }

  getDosenListData({String? month}) async {
    isLoadingHistory = true;
    update();
    teacherId = await SettingsUtils.getString("teacher_id");
    var res = await GetHistoryPresenceApi().request(teacherId: teacherId);
    if (res.status) {
      if (month != null) {
        absentList = res.listData!.where((element) => element!.presenceDate!.contains(month)).toList() as List<Presence?>;
      } else {
        absentList = res.listData as List<Presence?>;
      }
      isLoadingHistory = false;
      update();
    }
  }

  handleMonthChange(String? newValue) {
    selectedMonth = newValue;
    getDosenListData(month: selectedMonth);
    update();
  }
}
