import 'package:absent_payroll/src/core/base_import.dart';

import 'payroll_controller.dart';

class PayrollListItem extends StatefulWidget {
  final PayrollController controller;
  final Payroll? item;
  final int index;

  const PayrollListItem(this.controller, this.item, this.index, {super.key});

  @override
  State<PayrollListItem> createState() => _PayrollListItemState();
}

class _PayrollListItemState extends State<PayrollListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: Get.width,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    // height: 50,
                    child: Text(
                      '${widget.item?.salaryCreated}',
                      style: TypographyStyle.body4SemiBold.copyWith(color: ColorStyle().grayscaleRange[800]),
                      textAlign: TextAlign.center,
                    ),
                    // Marquee(
                    //   blankSpace: 20,
                    //   decelerationDuration: const Duration(milliseconds: 500),
                    //   accelerationCurve: Curves.easeInOut,
                    //   decelerationCurve: Curves.easeInOut,
                    //   text: '${widget.item?.salaryCreated}',
                    //   style: TypographyStyle.body4SemiBold.copyWith(color: ColorStyle().grayscaleRange[800]),
                    // ),
                  ),
                ),
                Expanded(
                  child: Container(
                    // height: 50,
                    child: Text(
                      '${widget.item?.honor}',
                      style: TypographyStyle.body4SemiBold.copyWith(color: ColorStyle().grayscaleRange[800]),
                      textAlign: TextAlign.center,
                    ),
                    // Marquee(
                    //   blankSpace: 20,
                    //   decelerationDuration: const Duration(milliseconds: 500),
                    //   accelerationCurve: Curves.easeInOut,
                    //   decelerationCurve: Curves.easeInOut,
                    //   text: '${widget.item?.checkin}',
                    //   style: TypographyStyle.body4SemiBold.copyWith(color: ColorStyle().grayscaleRange[800]),
                    // ),
                  ),
                ),
                Expanded(
                  child: Container(
                    // height: 50,
                    child: Text(
                      '${widget.item?.kehadiran}',
                      style: TypographyStyle.body4SemiBold.copyWith(color: ColorStyle().grayscaleRange[800]),
                      textAlign: TextAlign.center,
                    ),
                    // Marquee(
                    //   blankSpace: 20,
                    //   decelerationDuration: const Duration(milliseconds: 500),
                    //   accelerationCurve: Curves.easeInOut,
                    //   decelerationCurve: Curves.easeInOut,
                    //   text: '${widget.item?.checkout}',
                    //   style: TypographyStyle.body4SemiBold.copyWith(color: ColorStyle().grayscaleRange[800]),
                    // ),
                  ),
                ),
                Expanded(
                  child: Container(
                    // height: 50,
                    child: Text(
                      '${widget.item?.paymentMethod.toCapitalized()}',
                      style: TypographyStyle.body4SemiBold.copyWith(color: ColorStyle().grayscaleRange[800]),
                      textAlign: TextAlign.center,
                    ),
                    // Marquee(
                    //   blankSpace: 20,
                    //   decelerationDuration: const Duration(milliseconds: 500),
                    //   accelerationCurve: Curves.easeInOut,
                    //   decelerationCurve: Curves.easeInOut,
                    //   text: '${widget.item?.status}',
                    //   style: TypographyStyle.body4SemiBold.copyWith(color: ColorStyle().grayscaleRange[800]),
                    // ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Divider(
              thickness: 2,
              color: ColorStyle().grayscaleRange[200],
            ),
          )
        ],
      ),
    );
  }
}
