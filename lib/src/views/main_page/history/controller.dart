import 'package:absent_payroll/src/core/base_import.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class HistoryController extends BaseController {
  var mainScrollController = ScrollController();
  List<Attendance?> dosenList = [];

  EasyRefreshController refreshController = EasyRefreshController();

  bool isLoadingStatus = false;

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

  listData({int? pageTo}) async {
    isLoadingStatus = true;
    update();
    getDosenListData();
    isLoadingStatus = false;
    update();
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

  getDosenListData() async {
    dosenList = [
      Attendance(
        name: 'Dr. H. M. Fauzi, M.Kom',
        date: DateTime.now(),
        description: "Sakit demam",
        checkin: '-6.914744',
        checkout: '107.609810',
      ),
      Attendance(
        name: 'Dr. H. M. Fauzi, M.Kom',
        date: DateTime.now(),
        description: "Izin nikah",
        checkin: null,
        checkout: '107.609810',
      ),
      Attendance(
        name: 'Dr. H. M. Fauzi, M.Kom',
        date: DateTime.now(),
        description: 'Izin melahirkan',
        checkin: '-6.914744',
        checkout: null,
      ),
      Attendance(
        name: 'Dr. H. M. Fauzi, M.Kom',
        date: DateTime.now(),
        description: "Sakit tipes",
        checkin: "",
        checkout: '107.609810',
      ),
      Attendance(
        name: 'Dr. H. M. Fauzi, M.Kom',
        date: DateTime.now(),
        description: "Izin keluarga",
        checkin: '-6.914744',
        checkout: '107.609810',
      ),
    ];
    isLoadingStatus = false;
    update();
  }
}
