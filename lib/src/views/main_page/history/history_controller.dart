import 'package:absent_payroll/src/api/get_history_presence_api.dart';
import 'package:absent_payroll/src/core/base_import.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class HistoryController extends BaseController {
  var mainScrollController = ScrollController();
  List<Presence?> absentList = [], originalAbsentList = [];

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
    getHistoryAbsents();
  }

  @override
  onInit() {
    isLoading = true;
    update();
    super.onInit();
  }

  @override
  onReady() async {
    await getHistoryAbsents();
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

  getHistoryAbsents({String? month}) async {
    isLoadingHistory = true;
    update();
    if (month != null) {
      absentList = originalAbsentList;
      absentList = absentList.where((element) => element!.presenceDate.contains(month)).toList();
      isLoadingHistory = false;
      update();
      return;
    }
    teacherId = await SettingsUtils.getString("teacher_id");
    var res = await GetHistoryPresenceApi().request(teacherId: teacherId);
    if (res.status) {
      originalAbsentList = res.listData as List<Presence?>;
      absentList = res.listData as List<Presence?>;
    }
    isLoadingHistory = false;
    update();
  }

  handleMonthChange(String? newValue) {
    selectedMonth = newValue;
    getHistoryAbsents(month: selectedMonth);
    update();
  }

  getLateStatusPresence(String val){
    switch (val) {
      case "tidak-telat":
        return "Tidak";
      case "telat":
        return "Terlambat";
      default:
        return "Tidak";
    }
  }
}
