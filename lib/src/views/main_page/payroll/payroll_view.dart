import 'package:absent_payroll/src/core/base_import.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'payroll_controller.dart';
import 'payroll_list_item.dart';

class PayrollView extends StatefulWidget {
  const PayrollView({super.key});

  @override
  State<PayrollView> createState() => _PayrollViewState();
}

class _PayrollViewState extends State<PayrollView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PayrollController>(
      init: PayrollController(),
      builder: (controller) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: (controller.isLoading)
              ? const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.0),
                      child: SizedBox(
                        height: 32,
                        width: 32,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ],
                )
              : Stack(
                  children: [
                    EasyRefresh(
                      header: MaterialHeader(valueColor: AlwaysStoppedAnimation<Color>(ColorStyle.customGreyColor)),
                      controller: controller.refreshController,
                      onRefresh: () async {
                        controller.listData();
                        controller.refreshController.finishRefresh();
                      },
                      child: SingleChildScrollView(
                        physics: const ScrollPhysics(),
                        child: Column(
                          children: [
                            _header(context, controller),
                            if (controller.payrollList.isEmpty)
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Center(
                                  child: Text(
                                    'Data tidak ditemukan',
                                    style: TypographyStyle.body2Reguler.copyWith(color: ColorStyle().grayscaleRange[800]),
                                  ),
                                ),
                              )
                            else if (controller.isLoadingPayroll)
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Center(
                                  child: SizedBox(
                                    height: 32,
                                    width: 32,
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              )
                            else
                              ListView.builder(
                                physics: const ScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.payrollList.length,
                                itemBuilder: (context, index) {
                                  var item = controller.payrollList[index];
                                  return PayrollListItem(
                                    controller,
                                    item,
                                    index,
                                  );
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context, PayrollController controller) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: Get.width,
          height: 36,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Slip Gaji",
              style: TypographyStyle.body2SemiBold,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Divider(
            thickness: 2,
            color: ColorStyle().grayscaleRange[200],
          ),
        ),
        // make month with check box
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: ColorStyle().grayscaleRange[200]!,
                      ),
                    ),
                  ),
                  value: controller.selectedMonth,
                  onChanged: (String? newValue) {
                    controller.handleMonthChange(newValue);
                  },
                  items: controller.monthList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TypographyStyle.body2Reguler.copyWith(color: ColorStyle().grayscaleRange[800]),
                      ),
                    );
                  }).toList(),
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.handleMonthChange(null);
                },
                icon: const Icon(Icons.refresh),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Tanggal',
                  textAlign: TextAlign.center,
                  style: TypographyStyle.body2SemiBold.copyWith(color: ColorStyle().grayscaleRange[800]),
                ),
              ),
              Expanded(
                child: Text(
                  'Honor',
                  textAlign: TextAlign.center,
                  style: TypographyStyle.body2SemiBold.copyWith(color: ColorStyle().grayscaleRange[800]),
                ),
              ),
              Expanded(
                child: Text(
                  'Kehadiran',
                  textAlign: TextAlign.center,
                  style: TypographyStyle.body2SemiBold.copyWith(color: ColorStyle().grayscaleRange[800]),
                ),
              ),
              Expanded(
                child: Text(
                  'Metode Pembayaran',
                  textAlign: TextAlign.center,
                  style: TypographyStyle.body2SemiBold.copyWith(color: ColorStyle().grayscaleRange[800]),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 4, bottom: 12),
          child: Divider(
            thickness: 2,
            color: ColorStyle().grayscaleRange[200],
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
