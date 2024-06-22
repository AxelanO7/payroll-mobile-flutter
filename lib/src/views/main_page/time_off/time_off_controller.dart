import 'dart:ffi';
import 'dart:io';

import 'package:absent_payroll/src/core/base_import.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class TImeOffController extends BaseController {
  bool canPop = true;

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController proofController = TextEditingController();

  File? proofFile;
  FilePickerResult? resFilePicked;

  String? typeTimeOff;
  List<String> typeTimeOffList = [
    "Sakit",
    "Izin",
  ];

  @override
  onInit() {
    // isLoading = true;
    // update();
    super.onInit();
  }

  @override
  onReady() async {
    // isLoading = false;
    update();
    super.onReady();
  }

  @override
  onClose() async {
    super.onClose();
  }

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
            child: Text('Ambil Foto'),
          ),
          SizedBox(height: 8),
          CustomButton(
            onPressed: () {
              pickFile();
              Get.back();
            },
            child: Text('Pilih File'),
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
}
