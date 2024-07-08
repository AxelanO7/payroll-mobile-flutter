import 'dart:collection';
import 'dart:io';

import 'package:absent_payroll/src/api/clock_in_api.dart';
import 'package:absent_payroll/src/api/clock_out_api.dart';
import 'package:absent_payroll/src/api/upload_file_presence_api.dart';
import 'package:absent_payroll/src/core/base_import.dart';
import 'package:absent_payroll/src/views/attendance/sections/camera_section.dart';
import 'package:absent_payroll/src/views/attendance/sections/confirmation_section.dart';
import 'package:absent_payroll/src/views/attendance/sections/location_section.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as GMaps;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

class AttendanceController extends BaseController {
  bool canPop = true;
  PageController pageController = PageController();

  GMaps.LatLng gMapsMasterPosition = const GMaps.LatLng(-8.622508067177174, 115.24098192668382);
  GMaps.LatLng? gMapsCurrentPosition;

  Set<GMaps.Polyline> polylLines = HashSet<GMaps.Polyline>();
  Set<GMaps.Marker> markerSet = HashSet<GMaps.Marker>();

  LocationData? locationData;
  final Location location = Location();

  File? imageFile;

  String nameUser = "";
  late DateTime attendanceTime;

  String? selectedTypeAbsence;
  List<String> typeAbsenceList = [
    "Check In",
    "Check Out",
  ];

  String teacherId = '';

  @override
  onInit() {
    isLoading = true;
    super.onInit();
  }

  @override
  onReady() async {
    nameUser = await SettingsUtils.getString('name_user');
    await getLocationUser();
    isLoading = false;
    update();
    super.onReady();
  }

  @override
  onClose() async {
    super.onClose();
  }

  Widget pageItemBuilder(context, position) {
    switch (position) {
      case 0:
        return const LocationSection();
      case 1:
        return const CameraSection();
      case 2:
        return const ConfirmationSection();
    }
    return Container();
  }

  onGoBack() {
    if (pageController.page!.toInt() == 0) {
      Get.back();
    } else {
      pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  getLocationUser() async {
    locationData = await location.getLocation();
    gMapsCurrentPosition = GMaps.LatLng(locationData?.latitude ?? 0, locationData?.longitude ?? 0);
  }

  saveLocationPresence() {
    // current position must 500 meters from the master location
    // if (gMapsCurrentPosition!.latitude >= gMapsMasterPosition.latitude - 0.0045 &&
    //     gMapsCurrentPosition!.latitude <= gMapsMasterPosition.latitude + 0.0045 &&
    //     gMapsCurrentPosition!.longitude >= gMapsMasterPosition.longitude - 0.0045 &&
    //     gMapsCurrentPosition!.longitude <= gMapsMasterPosition.longitude + 0.0045) {
    Get.snackbar('Berhasil', 'Lokasi berhasil disimpan');
    attendanceTime = DateTime.now();
    pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    // } else {
    //   Get.snackbar('Gagal', 'Lokasi tidak sesuai');
    // }
  }

  takePicturePresence() async {
    var result = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 25);
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: result!.path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9
            ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Adjust Image',
            toolbarColor: ColorStyle.blackColor,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: false),
        IOSUiSettings(
          rectX: 1.0,
          rectY: 1.0,
          title: 'Adjust Image',
        )
      ],
    );
    if (croppedFile != null) {
      imageFile = File(croppedFile.path);
      update();
    }
  }

  savePicturePresence() async {
    if (imageFile == null) {
      Get.snackbar("Gambar belum diambil", "Silahkan ambil gambar terlebih dahulu");
      return;
    }
    Get.snackbar('Berhasil', 'Foto berhasil disimpan');
    pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  bool validateSubmit() {
    int error = 0;
    if (selectedTypeAbsence == null) {
      error++;
    }
    return error == 0;
  }

  submitAttendance() async {
    if (!validateSubmit()) {
      Get.snackbar('Peringatan', 'Silahkan pilih tipe absensi');
      return;
    }
    var resUpload = await UploadFilePresenceApi().request(file: imageFile!);
    teacherId = await SettingsUtils.getString("teacher_id");
    if (selectedTypeAbsence == "Check Out") {
      var resSubmitOut = await ClockOutApi().request(
          teacherId: teacherId,
          clockOut: DateTime.parse(attendanceTime.toString()).toIso8601String(),
          latitudeOut: gMapsCurrentPosition!.latitude.toString(),
          longitudeOut: gMapsCurrentPosition!.longitude.toString(),
          photoOut: imageFile!.path);
      if (resSubmitOut.status) {
        Get.snackbar('Berhasil', 'Absensi berhasil disimpan');
        Get.offAllNamed(AppRoutes.mainPage);
      }
    } else {
      var resSubmitIn = await ClockInApi().request(
          clockIn: DateTime.parse(attendanceTime.toString()).toIso8601String(),
          device: Platform.isAndroid ? "android" : "ios",
          latitudeIn: gMapsCurrentPosition!.latitude.toString(),
          longitudeIn: gMapsCurrentPosition!.longitude.toString(),
          photoIn: imageFile!.path,
          teacherId: teacherId);
      if (resSubmitIn.status) {
        Get.snackbar('Berhasil', 'Absensi berhasil disimpan');
        // Get.offAllNamed(AppRoutes.mainPage);
      }
    }
  }
}
