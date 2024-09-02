import 'package:absent_payroll/src/core/base_import.dart';
import 'package:intl/intl.dart';

import 'time_off_controller.dart';

class TimeOffView extends StatelessWidget {
  const TimeOffView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TImeOffController>(
      init: TImeOffController(),
      builder: (controller) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorStyle.whiteColor,
            systemOverlayStyle: SystemUiOverlayStyle(
              // Android
              statusBarColor: ColorStyle.whiteColor,
              statusBarIconBrightness: Brightness.dark,
              // iOS
              statusBarBrightness: Brightness.light,
              systemNavigationBarIconBrightness: Brightness.dark,
              systemNavigationBarDividerColor: ColorStyle.whiteColor,
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: ColorStyle().grayscaleRange[900],
              ),
              onPressed: Get.back,
            ),
            title: Text(
              "Cuti",
              style: TypographyStyle.body2SemiBold.copyWith(color: ColorStyle().grayscaleRange[900]),
              textAlign: TextAlign.center,
            ),
            elevation: 0,
            centerTitle: true,
          ),
          body: Container(
            color: ColorStyle.whiteColor,
            width: Get.width,
            height: Get.height,
            child: ScrollConfiguration(
              behavior: CustomDisableGlowBehavior(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 2,
                    color: ColorStyle().grayscaleRange[200],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        // start date
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tanggal Mulai",
                              style: TypographyStyle.body2Medium,
                            ),
                            const SizedBox(height: 4),
                            TextField(
                              controller: controller.startDateController,
                              readOnly: true,
                              onTap: () async {
                                final DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2015, 8),
                                  lastDate: DateTime(2101),
                                );
                                if (picked != null) {
                                  controller.unformattedStartDate = DateFormat('yyyy-MM-dd').format(picked);
                                  controller.startDateController.text = DateFormat('dd MMMM yyyy').format(picked);
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Pilih tanggal',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        // end date
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tanggal Selesai",
                              style: TypographyStyle.body2Medium,
                            ),
                            const SizedBox(height: 4),
                            TextField(
                              controller: controller.endDateController,
                              readOnly: true,
                              onTap: () async {
                                final DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2015, 8),
                                  lastDate: DateTime(2101),
                                );
                                if (picked != null) {
                                  controller.unformattedEndDate = DateFormat('yyyy-MM-dd').format(picked);
                                  controller.endDateController.text = DateFormat('dd MMMM yyyy').format(picked);
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Pilih tanggal',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        // proof
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Surat Keterangan",
                              style: TypographyStyle.body2Medium,
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    readOnly: true,
                                    controller: controller.proofController,
                                    decoration: InputDecoration(
                                      hintText: 'Masukkan surat keterangan',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(onPressed: controller.tapPickFile, child: const Text('Pilih File'))
                              ],
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                        // type
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jenis Cuti",
                              style: TypographyStyle.body2Medium,
                            ),
                            const SizedBox(height: 4),
                            DropdownButton<String>(
                              isExpanded: true,
                              value: controller.typeTimeOff,
                              onChanged: (String? newValue) {
                                controller.typeTimeOff = newValue!;
                                controller.update();
                              },
                              items: controller.typeTimeOffList.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        CustomButton(
                          onPressed: controller.handleSubmit,
                          width: Get.width - 40,
                          height: 48,
                          color: ColorStyle.blackColor,
                          child: Text(
                            'Ajukan Cuti',
                            style: TypographyStyle.body2Medium.copyWith(color: ColorStyle.whiteColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
