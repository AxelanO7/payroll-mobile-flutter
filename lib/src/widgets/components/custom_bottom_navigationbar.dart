import 'package:absent_payroll/src/core/base_import.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FABBottomAppBarItem {
  FABBottomAppBarItem({this.iconData, this.text});

  String? iconData;
  String? text;
}

class FABBottomAppBar extends StatefulWidget {
  const FABBottomAppBar({
    super.key,
    required this.items,
    this.onFabTapped = false,
    this.centerItemText,
    this.height = 60.0,
    this.iconSize = 24.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.currentIndex = 0,
    this.onTabSelected,
  });

  final bool onFabTapped;
  final List<FABBottomAppBarItem> items;
  final String? centerItemText;
  final double height;
  final double iconSize;
  final int currentIndex;
  final Color? backgroundColor;
  final Color? color;
  final Color? selectedColor;
  final NotchedShape? notchedShape;
  final ValueChanged<int>? onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  // int _selectedIndex = 0;

  _updateIndex(int index) {
    if (widget.onTabSelected != null) widget.onTabSelected!(index);
    setState(() {
      // _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      padding: EdgeInsets.symmetric(
          horizontal: context.isTablet
              ? context.isLargeTablet
                  ? Get.width * .25
                  : Get.width * .15
              : 20),
      decoration: BoxDecoration(
        color: ColorStyle.whiteColor,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(.1), blurRadius: 8.0, offset: const Offset(0, -8)),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.centerItemText ?? '',
              style: TextStyle(color: widget.color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    FABBottomAppBarItem? item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    // ignore: unused_local_variable
    Color? color = widget.currentIndex == index ? widget.selectedColor : ColorStyle().grayscaleRange[400];
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () => onPressed(index),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 4),
                    Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                      SvgPicture.asset(
                        item!.iconData!,
                        height: 26,
                        width: 26,
                        color: color,
                      ),
                    ]),
                    // Icon(item.iconData, color: color, size: widget.iconSize),
                    const SizedBox(height: 3),
                    Text(
                      item.text ?? '',
                      style: TypographyStyle.body2Reguler.copyWith(letterSpacing: .75, color: color), //.copyWith(color: color),
                    ),
                    const SizedBox(height: 4),
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
