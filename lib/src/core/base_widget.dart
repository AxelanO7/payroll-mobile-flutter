import 'package:absent_payroll/src/core/base_import.dart';
import 'package:absent_payroll/src/debug/console/console.dart';

class BaseWidget<X extends GetxController> extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final X? controller;
  final Color? backgroundColor;
  final GetControllerBuilder<X>? bottomNavigationBarMobile;
  final GetControllerBuilder<X>? bottomNavigationBarDesktop;
  final GetControllerBuilder<X>? mobile;
  final GetControllerBuilder<X>? desktop;
  final Widget? overlayTopWidget;

  // final Function(X, bool)? child;
  final bool safeAreaTop;
  final bool safeAreaLeft;
  final bool safeAreaRight;
  final bool safeAreaBottom;
  final bool extendBody;

  const BaseWidget({
    super.key,
    this.controller,
    // required this.child,
    this.backgroundColor,
    this.safeAreaTop = false,
    this.safeAreaLeft = true,
    this.safeAreaRight = true,
    this.safeAreaBottom = false,
    this.extendBody = false,
    this.overlayTopWidget,
    this.bottomNavigationBarMobile,
    this.bottomNavigationBarDesktop,
    this.appBar,
    required this.mobile,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    //tablet: 768x812
    bool isDesktop = (mediaQueryData.size.width >= 768 && mediaQueryData.size.height >= 812) ? true : false;
    return GetBuilder<X>(
      init: controller,
      builder: (controller) => Stack(
        children: [
          MediaQuery(
            data: mediaQueryData.copyWith(textScaleFactor: 1.0),
            child: SafeArea(
              top: safeAreaTop,
              left: safeAreaLeft,
              right: safeAreaRight,
              bottom: safeAreaBottom,
              child: Scaffold(
                extendBody: extendBody,
                resizeToAvoidBottomInset: true,
                appBar: appBar,
                body: Stack(
                  children: [
                    isDesktop ? _body(controller, desktop ?? mobile) ?? Container() : _body(controller, mobile) ?? Container(),
                    // Positioned(
                    //   right: 0,
                    //   child: GestureDetector(
                    //     onTap: () => showDebugConsole(context),
                    //     child: Container(
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(5),
                    //         color: ColorStyle().grayscaleRange[200]?.withOpacity(.8),
                    //       ),
                    //       margin: EdgeInsets.symmetric(horizontal: 8, vertical: appBar == null ? MediaQuery.of(context).viewPadding.top : 0),
                    //       padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4.5),
                    //       child: Text(
                    //         "UNDER DEVELOPMENT",
                    //         style: TypographyStyle.body4Medium.copyWith(
                    //           fontSize: 11,
                    //           color: ColorStyle.blackColor.withOpacity(.8),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                backgroundColor: backgroundColor ?? Colors.white,
                bottomNavigationBar: isDesktop
                    ? bottomNavigationBarDesktop != null
                        ? _body(controller, bottomNavigationBarDesktop)
                        : null
                    : bottomNavigationBarMobile != null
                        ? _body(controller, bottomNavigationBarMobile)
                        : null,
              ),
            ),
          ),
          overlayTopWidget ?? const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget? _body(
    X controller,
    GetControllerBuilder<X>? child,
  ) {
    return child != null ? child(controller) : Container();
  }

  Widget? _bottomNavigationBar(
    X controller,
    GetControllerBuilder<X>? child,
  ) {
    return child != null ? child(controller) : Container();
  }
// Widget? _body(X controller) {
//   return child!=null?child!(controller):Container();
// }
}

class RootBaseWidget<X extends GetxController> extends StatelessWidget {
  final X? controller;
  final GetControllerBuilder<X> baseWidget;

  const RootBaseWidget({
    super.key,
    this.controller,
    required this.baseWidget,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<X>(
      init: controller,
      builder: (controller) => baseWidget(controller),
    );
  }
}
