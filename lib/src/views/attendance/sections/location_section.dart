import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:absent_payroll/src/core/base_import.dart';
import 'package:absent_payroll/src/views/attendance/attendance_controller.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

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
              'Location Attendance',
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
                      child: Column(
                        children: [
                          Expanded(
                            child: GoogleMap(
                              polylines: controller.polylLines,
                              markers: controller.markerSet,
                              mapType: MapType.normal,
                              myLocationEnabled: true,
                              initialCameraPosition: CameraPosition(
                                zoom: 18,
                                target: controller.gMapsCurrentPosition!,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          CustomButton(
                            width: Get.width - 32,
                            height: 48,
                            color: ColorStyle.hashMicroGreyColor,
                            radius: 12,
                            onPressed: controller.saveLocationPresence,
                            child: Text('Save Location', style: TypographyStyle.body2Bold.copyWith(color: ColorStyle.whiteColor)),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
