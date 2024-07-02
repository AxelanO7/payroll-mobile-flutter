import 'package:absent_payroll/src/core/base_import.dart';
import 'package:marquee/marquee.dart';

import 'controller.dart';

class ListItem extends StatefulWidget {
  final HistoryController controller;
  final Presence? item;
  final int index;

  const ListItem(this.controller, this.item, this.index, {super.key});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
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
                    height: 50,
                    child: Marquee(
                      blankSpace: 20,
                      decelerationDuration: const Duration(milliseconds: 500),
                      accelerationCurve: Curves.easeInOut,
                      decelerationCurve: Curves.easeInOut,
                      text: '${widget.item?.date}',
                      style: TypographyStyle.body4SemiBold.copyWith(color: ColorStyle().grayscaleRange[800]),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    child: (widget.item?.checkin == null || widget.item?.checkin == "") ? Icon(Icons.close) : Icon(Icons.check),
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
                    height: 50,
                    child: (widget.item?.checkout == null || widget.item?.checkout == "") ? Icon(Icons.close) : Icon(Icons.check),
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
                    height: 50,
                    child: Marquee(
                      blankSpace: 20,
                      decelerationDuration: const Duration(milliseconds: 500),
                      accelerationCurve: Curves.easeInOut,
                      decelerationCurve: Curves.easeInOut,
                      text: '${widget.item?.description}',
                      style: TypographyStyle.body4SemiBold.copyWith(color: ColorStyle().grayscaleRange[800]),
                    ),
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
