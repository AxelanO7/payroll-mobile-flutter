import 'package:absent_payroll/src/api/get_history_payroll_api.dart';
import 'package:absent_payroll/src/core/base_import.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class PayrollController extends BaseController {
  var mainScrollController = ScrollController();
  List<Payroll?> payrollList = [], originalPayrollList = [];

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

  bool isLoadingPayroll = false;

  listData({int? pageTo}) async {
    getPayrolls();
  }

  @override
  onInit() {
    isLoading = true;
    update();
    super.onInit();
  }

  @override
  onReady() async {
    await getPayrolls();
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

  getPayrolls({String? month}) async {
    isLoadingPayroll = true;
    update();
    if (month != null) {
      payrollList = originalPayrollList;
      payrollList = payrollList.where((element) => element!.salaryCreated.contains(month)).toList();
      isLoadingPayroll = false;
      update();
      return;
    }
    teacherId = await SettingsUtils.getString("teacher_id");
    var res = await GetHistoryPayrollApi().request(teacherId: teacherId);
    if (res.status) {
      if (month != null) {
        payrollList = res.listData!.where((element) => element!.presenceDate!.contains(month)).toList() as List<Payroll?>;
      } else {
        payrollList = res.listData as List<Payroll?>;
      }
      isLoadingPayroll = false;
      update();
    }
  }

  handleMonthChange(String? newValue) {
    selectedMonth = newValue;
    getPayrolls(month: selectedMonth);
    update();
  }
}
