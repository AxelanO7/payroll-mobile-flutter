import 'package:absent_payroll/src/api/generate_pdf_salary_api.dart';
import 'package:absent_payroll/src/api/get_history_payroll_api.dart';
import 'package:absent_payroll/src/core/base_import.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

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
      print('payrollList: $payrollList');
      print('originalPayrollList: $originalPayrollList');
      for (var i = 0; i < payrollList.length; i++) {
        var element = payrollList[i];
        var date = element!.salaryCreated;
        var formatter = DateFormat('yyyy-MM-dd');
        var dateFormatted = formatter.parse(date);
        var monthString = DateFormat('MMMM').format(dateFormatted);
        // change to indonesian
        if (monthString == 'January') {
          monthString = 'Januari';
        } else if (monthString == 'February') {
          monthString = 'Februari';
        } else if (monthString == 'March') {
          monthString = 'Maret';
        } else if (monthString == 'April') {
          monthString = 'April';
        } else if (monthString == 'May') {
          monthString = 'Mei';
        } else if (monthString == 'June') {
          monthString = 'Juni';
        } else if (monthString == 'July') {
          monthString = 'Juli';
        } else if (monthString == 'August') {
          monthString = 'Agustus';
        } else if (monthString == 'September') {
          monthString = 'September';
        } else if (monthString == 'October') {
          monthString = 'Oktober';
        } else if (monthString == 'November') {
          monthString = 'November';
        } else if (monthString == 'December') {
          monthString = 'Desember';
        }
        if (monthString != month) {
          payrollList.remove(element);
        }
      }
      isLoadingPayroll = false;
      update();
    } else {
      teacherId = await SettingsUtils.getString("teacher_id");
      var res = await GetHistoryPayrollApi().request(teacherId: teacherId);
      if (res.status) {
        payrollList = res.listData as List<Payroll?>;
        originalPayrollList = res.listData as List<Payroll?>;
        isLoadingPayroll = false;
        update();
      }
    }
  }

  handlePdfDownload() async {
    if (selectedMonth == null) {
      Get.snackbar('Error', 'Pilih bulan terlebih dahulu');
      return;
    }
    if (payrollList.isEmpty) {
      Get.snackbar('Error', 'Data tidak ditemukan');
      return;
    }
    int monthNumber = monthList.indexOf(selectedMonth!) + 1;
    var res = await GeneratePdfSalaryApi().request(employeeId: teacherId, month: monthNumber);
    if (res.status) {
      var data = res.data as PdfUrl;
      await launch(data.url);
    }
  }

  handleMonthChange(String? newValue) {
    selectedMonth = newValue;
    getPayrolls(month: selectedMonth);
    update();
  }
}
