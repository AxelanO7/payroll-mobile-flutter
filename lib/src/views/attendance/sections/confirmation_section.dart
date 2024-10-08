import 'package:absent_payroll/src/core/base_import.dart';
import 'package:absent_payroll/src/views/attendance/attendance_controller.dart';

class ConfirmationSection extends StatelessWidget {
  const ConfirmationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttendanceController>(
      builder: (controller) => PopScope(
        canPop: controller.canPop,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: ColorStyle.customGreyColor),
              onPressed: controller.onGoBack,
            ),
            backgroundColor: ColorStyle.whiteColor,
            title: Text(
              'Konfirmasi Absensi',
              style: TypographyStyle.body1SemiBold,
            ),
            centerTitle: true,
          ),
          backgroundColor: ColorStyle.whiteColor,
          body: controller.isLoading
              ? const Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : ScrollConfiguration(
                  behavior: CustomDisableGlowBehavior(),
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: Get.height - 84,
                      width: Get.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            const SizedBox(height: 12),
                            Container(
                              width: Get.width,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: ColorStyle.grayBorderColor, width: 2),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorStyle.customGreyColor.withOpacity(0.1),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name : ${controller.nameUser}',
                                    style: TypographyStyle.body2SemiBold.copyWith(color: ColorStyle.customGreyColor),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Date Attendance  : ${controller.attendanceTime.toLocal().toString().substring(0, 10)}',
                                    style: TypographyStyle.body2SemiBold.copyWith(color: ColorStyle.customGreyColor),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Time Attendance  : ${controller.attendanceTime.toLocal().toString().substring(11, 16)}',
                                    style: TypographyStyle.body2SemiBold.copyWith(color: ColorStyle.customGreyColor),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Latitude Attendance  : ${controller.locationData!.latitude}',
                                    style: TypographyStyle.body2SemiBold.copyWith(color: ColorStyle.customGreyColor),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Longitude Attendance  : ${controller.locationData!.longitude}',
                                    style: TypographyStyle.body2SemiBold.copyWith(color: ColorStyle.customGreyColor),
                                  ),
                                  const SizedBox(height: 12),
                                  DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color: ColorStyle.grayBorderColor,
                                        ),
                                      ),
                                    ),
                                    value: controller.selectedTypeAbsence,
                                    onChanged: (String? newValue) {
                                      controller.selectedTypeAbsence = newValue!;
                                      controller.update();
                                    },
                                    items: controller.typeAbsenceList.map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TypographyStyle.body2Reguler.copyWith(color: ColorStyle.customGreyColor),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Picture Attendance  :',
                                    style: TypographyStyle.body2SemiBold.copyWith(color: ColorStyle.customGreyColor),
                                  ),
                                  const SizedBox(height: 8),
                                  Image.file(
                                    controller.imageFile!,
                                    width: Get.width - 32,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            CustomButton(
                              width: Get.width - 32,
                              height: 48,
                              color: ColorStyle.customGreyColor,
                              radius: 12,
                              onPressed: controller.submitAttendance,
                              child: Text('Konfirmasi', style: TypographyStyle.body2Bold.copyWith(color: ColorStyle.whiteColor)),
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
