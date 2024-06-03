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
              icon: Icon(Icons.arrow_back_ios, color: ColorStyle.hashMicroGreyColor),
              onPressed: controller.onGoBack,
            ),
            backgroundColor: ColorStyle.whiteColor,
            title: Text(
              'Confirmation Attendance',
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
                                    color: ColorStyle.hashMicroGreyColor.withOpacity(0.1),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name Submitter : ${controller.nameUser}',
                                    style: TypographyStyle.body2SemiBold.copyWith(color: ColorStyle.hashMicroGreyColor),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Date Attendance  : ${controller.attendanceTime.toLocal(
                                      ).toString().substring(0, 10)}',
                                    style: TypographyStyle.body2SemiBold.copyWith(color: ColorStyle.hashMicroGreyColor),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Time Attendance  : ${controller.attendanceTime.toLocal().toString().substring(11, 16)}',
                                    style: TypographyStyle.body2SemiBold.copyWith(color: ColorStyle.hashMicroGreyColor),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Latitude Attendance  : ${controller.locationData!.latitude}',
                                    style: TypographyStyle.body2SemiBold.copyWith(color: ColorStyle.hashMicroGreyColor),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Longitude Attendance  : ${controller.locationData!.longitude}',
                                    style: TypographyStyle.body2SemiBold.copyWith(color: ColorStyle.hashMicroGreyColor),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Picture Attendance  :',
                                    style: TypographyStyle.body2SemiBold.copyWith(color: ColorStyle.hashMicroGreyColor),
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
                              color: ColorStyle.hashMicroGreyColor,
                              radius: 12,
                              onPressed: controller.confirmAttendance,
                              child: Text('Confirm', style: TypographyStyle.body2Bold.copyWith(color: ColorStyle.whiteColor)),
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
