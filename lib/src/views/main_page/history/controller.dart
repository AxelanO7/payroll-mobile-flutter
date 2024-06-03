import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:absent_payroll/src/core/base_import.dart';

class HistoryController extends BaseController {
  var mainScrollController = ScrollController();
  List<Attendance?> dosenList = [];

  EasyRefreshController refreshController = EasyRefreshController();

  bool isLoadingStatus = false;

  listData({int? pageTo}) async {
    getDosenListData();
  }

  @override
  onInit() {
    isLoading = true;
    super.onInit();
  }

  @override
  onReady() async {
    await getDosenListData();
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
        image: 'assets/images/dosen1.png',
        latitude: '-6.914744',
        longitude: '107.609810',
      ),
      Attendance(
        name: 'Dr. H. M. Fauzi, M.Kom',
        date: DateTime.now(),
        image: 'assets/images/dosen1.png',
        latitude: '-6.914744',
        longitude: '107.609810',
      ),
      Attendance(
        name: 'Dr. H. M. Fauzi, M.Kom',
        date: DateTime.now(),
        image: 'assets/images/dosen1.png',
        latitude: '-6.914744',
        longitude: '107.609810',
      ),
      Attendance(
        name: 'Dr. H. M. Fauzi, M.Kom',
        date: DateTime.now(),
        image: 'assets/images/dosen1.png',
        latitude: '-6.914744',
        longitude: '107.609810',
      ),
      Attendance(
        name: 'Dr. H. M. Fauzi, M.Kom',
        date: DateTime.now(),
        image: 'assets/images/dosen1.png',
        latitude: '-6.914744',
        longitude: '107.609810',
      ),
    ];
    isLoadingStatus = false;
    update();
  }
}
