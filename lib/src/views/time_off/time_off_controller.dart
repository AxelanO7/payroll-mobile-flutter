import 'dart:io';

import 'package:absent_payroll/src/api/submit_timeoff_api.dart';
import 'package:absent_payroll/src/api/upload_file_timeoff_api.dart';
import 'package:absent_payroll/src/core/base_import.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class TImeOffController extends BaseController {
  bool canPop = true;

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  String unformattedStartDate = '';
  String unformattedEndDate = '';

  TextEditingController proofController = TextEditingController();

  File? proofFile;
  FilePickerResult? resFilePicked;

  String? typeTimeOff;

  // # TYPE : 'annual', 'sick_without_docs', 'sick_with_docs', 'holiday', 'unpaid', 'special_permit'
  List<String> typeTimeOffList = ["Cuti Tahunan", "Sakit Tanpa Surat Dokter", "Sakit Dengan Surat Dokter", "Cuti Hari Raya", "Cuti Tanpa Gaji", "Izin Khusus"];

  String teacherId = '';




  onGoBack() {
    Get.back();
  }

  tapPickFile() {
    Get.defaultDialog(
      title: 'Pilih File',
      content: Column(
        children: [
          CustomButton(
            onPressed: () {
              takePictureProof();
              Get.back();
            },
            child: const Text('Ambil Foto'),
          ),
          const SizedBox(height: 8),
          CustomButton(
            onPressed: () {
              pickFile();
              Get.back();
            },
            child: const Text('Pilih File'),
          ),
        ],
      ),
    );
  }

  pickFile() async {
    resFilePicked = await FilePicker.platform.pickFiles();
    if (resFilePicked != null) {
      proofFile = File(resFilePicked!.files.single.path!);
      proofController.text = resFilePicked!.files.single.name;
      update();
    }
  }

  takePictureProof() async {
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
      proofFile = File(croppedFile.path);
      proofController.text = result.name;
      update();
    }
  }

  bool validateSubmit() {
    int error = 0;
    if (startDateController.text.isEmpty) {
      Get.snackbar('Peringatan', 'Tanggal Mulai tidak boleh kosong');
      error++;
    } else if (endDateController.text.isEmpty) {
      Get.snackbar('Peringatan', 'Tanggal Selesai tidak boleh kosong');
      error++;
    } else if (proofController.text.isEmpty) {
      Get.snackbar('Peringatan', 'Bukti tidak boleh kosong');
      error++;
    }
    return error == 0;
  }

  String getTypeEng() {
    switch (typeTimeOff) {
      case "Cuti Tahunan":
        return "annual";
      case "Sakit Tanpa Surat Dokter":
        return "sick_without_docs";
      case "Sakit Dengan Surat Dokter":
        return "sick_with_docs";
      case "Cuti Hari Raya":
        return "holiday";
      case "Cuti Tanpa Gaji":
        return "unpaid";
      case "Izin Khusus":
        return "special_permit";
      default:
        return "";
    }
  }

  handleSubmit() async {
    if (!validateSubmit()) {
      Get.snackbar('Peringatan', 'Data tidak lengkap');
      return;
    }
    teacherId = await SettingsUtils.getString("teacher_id");
    String type = getTypeEng();
    String documentName = "";
    late String urlUpload = "";
    if (proofFile != null) {
      documentName = proofFile!.path.split('/').last;
    } else if (resFilePicked != null) {
      documentName = resFilePicked!.files.single.name;
    }
    if (documentName.isEmpty) {
      Get.snackbar('Peringatan', 'Bukti tidak boleh kosong');
      return;
    } else {
      var resUpload = await UploadFileTimeoffApi().request(file: proofFile!);
      if (resUpload.status) {
        UrlUpload responseUpload = resUpload.data as UrlUpload;
        urlUpload = responseUpload.url;
      }
    }
    var res = await SubmitTimeoffApi()
        .request(teacherId: teacherId, startDate: unformattedStartDate, endDate: unformattedEndDate, description: type, type: type, document: urlUpload);
    Get.snackbar("message", res.message.toString());
    if (res.status) {
      Get.snackbar('Berhasil', 'Pengajuan Cuti Berhasil');
    } else {
      Get.snackbar('Gagal', 'Pengajuan Cuti Gagal');
    }
  }
}
