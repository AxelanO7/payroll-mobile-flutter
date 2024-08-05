import 'package:absent_payroll/src/core/base_import.dart';

import 'history_controller.dart';

class HistoryListItem extends StatefulWidget {
  final HistoryController controller;
  final Presence? item;
  final int index;

  const HistoryListItem(this.controller, this.item, this.index, {super.key});

  @override
  State<HistoryListItem> createState() => _HistoryListItemState();
}

class _HistoryListItemState extends State<HistoryListItem> {
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
                      '${widget.item?.presenceDate}',
                      style: TypographyStyle.body4SemiBold.copyWith(color: ColorStyle().grayscaleRange[800]),
                      textAlign: TextAlign.center,
                    ),
                    // Marquee(
                    //   blankSpace: 20,
                    //   decelerationDuration: const Duration(milliseconds: 500),
                    //   accelerationCurve: Curves.easeInOut,
                    //   decelerationCurve: Curves.easeInOut,
                    //   text: '${widget.item?.presenceDate}',
                    //   style: TypographyStyle.body4SemiBold.copyWith(color: ColorStyle().grayscaleRange[800]),
                    // ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50, child: (widget.item?.clockIn == "") ? Icon(Icons.close) : Icon(Icons.check),
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
                    height: 50, child: (widget.item?.clockOut == "") ? Icon(Icons.close) : Icon(Icons.check),
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
                      '${widget.item?.statusPresence.toCapitalized()}',
                      style: TypographyStyle.body4SemiBold.copyWith(color: ColorStyle().grayscaleRange[800]),
                      textAlign: TextAlign.center,
                    ),
                    // Marquee(
                    //   blankSpace: 20,
                    //   decelerationDuration: const Duration(milliseconds: 500),
                    //   accelerationCurve: Curves.easeInOut,
                    //   decelerationCurve: Curves.easeInOut,
                    //   text: '${widget.item?.statusPresence}',
                    //   style: TypographyStyle.body4SemiBold.copyWith(color: ColorStyle().grayscaleRange[800]),
                    // ),
                  ),
                ),
                Expanded(
                  child: Container(
                    // height: 50,
                    child: Text(
                      '${widget.item?.status.toCapitalized()}',
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
