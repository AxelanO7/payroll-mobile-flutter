import 'package:flutter_svg/flutter_svg.dart';
import 'package:absent_payroll/src/views/main_page/main_page_controller.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'package:absent_payroll/src/core/base_import.dart';

import 'controller.dart';

class HomePageMobilePage extends StatefulWidget {
  final MainPageController rootController;

  const HomePageMobilePage({super.key, required this.rootController});

  @override
  _HomePageMobilePageState createState() => _HomePageMobilePageState();
}

class _HomePageMobilePageState extends State<HomePageMobilePage> with AutomaticKeepAliveClientMixin<HomePageMobilePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<HomePageController>(
      init: HomePageController(rootController: widget.rootController),
      builder: (controller) => Stack(
        children: [
          EasyRefresh(
            header: MaterialHeader(
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
            ),
            controller: controller.refreshController,
            // onRefresh: controller.onRefresh,
            child: ListView.builder(
              controller: controller.mainScrollController,
              physics: const ClampingScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context, index) {
                return (controller.isLoading)
                    ? const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24.0),
                        child: SizedBox(height: 32, width: 32, child: CircularProgressIndicator()),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(children: [
                            Container(
                              color: ColorStyle.blackColor,
                              height: 278,
                            ),
                            Container(
                              height: 308,
                            ),
                            SizedBox(
                              height: 278,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                  child: SvgPicture.asset(
                                    "assets/images/global/classroom.svg",
                                    height: 220,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "HI!, Welcome",
                                      style: TypographyStyle.body3Medium.copyWith(color: ColorStyle.whiteColor),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      controller.name_user,
                                      style: TypographyStyle.body1Bold.copyWith(color: ColorStyle.whiteColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                height: 308,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: InkWell(
                                    // onTap: controller.goToAbout,
                                    child: Container(
                                      height: 64,
                                      decoration: BoxDecoration(
                                          color: ColorStyle.whiteColor,
                                          borderRadius: BorderRadius.circular(16),
                                          border: Border.all(color: ColorStyle().grayscaleRange[200]!, width: 2)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                          Image.asset(
                                            "assets/images/global/logo.png",
                                            height: 40,
                                          ),
                                          const SizedBox(
                                            width: 32,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "SMP Widya Sakti",
                                              style: TypographyStyle.body1Bold.copyWith(color: ColorStyle().grayscaleRange[900]),
                                            ),
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            size: 20,
                                          )
                                        ]),
                                      ),
                                    ),
                                  ),
                                ))
                          ]),
                          const SizedBox(
                            height: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Menu',
                                  style: TypographyStyle.body1Bold.copyWith(color: ColorStyle().grayscaleRange[900]),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16, right: 8.0, top: 8, bottom: 8),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(16),
                                          child: Container(
                                            margin: const EdgeInsets.only(right: 8),
                                            height: 180,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(16),
                                                border: Border.all(color: ColorStyle().grayscaleRange[200]!, width: 2)),
                                            child: InkWell(
                                              borderRadius: BorderRadius.circular(12),
                                              onTap: controller.doAttendance,
                                              child: Stack(
                                                children: [
                                                  Align(
                                                      alignment: Alignment.bottomCenter,
                                                      child: Container(
                                                        height: 85,
                                                        color: ColorStyle().grayscaleRange[100],
                                                      )),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 8.0),
                                                        child: Align(
                                                          alignment: Alignment.center,
                                                          child: SvgPicture.asset(
                                                            "assets/images/global/items.svg",
                                                            height: 100,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              const BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                                                          color: ColorStyle.whiteColor,
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                              height: 2,
                                                              color: ColorStyle().grayscaleRange[200],
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                                              child: Center(
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  children: [
                                                                    Text("Absensi",
                                                                        style: TypographyStyle.body1SemiBold.copyWith(color: ColorStyle().grayscaleRange[900])),
                                                                    Text("Absen sekarang",
                                                                        style: TypographyStyle.body3Medium.copyWith(color: ColorStyle().grayscaleRange[500])),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(16),
                                          child: Container(
                                            margin: const EdgeInsets.only(right: 8),
                                            height: 180,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(16),
                                                border: Border.all(color: ColorStyle().grayscaleRange[200]!, width: 2)),
                                            child: InkWell(
                                              borderRadius: BorderRadius.circular(12),
                                              onTap: controller.resetAccount,
                                              child: Stack(
                                                children: [
                                                  Align(
                                                      alignment: Alignment.bottomCenter,
                                                      child: Container(
                                                        height: 85,
                                                        color: ColorStyle().grayscaleRange[100],
                                                      )),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 8.0),
                                                        child: Align(
                                                          alignment: Alignment.center,
                                                          child: SvgPicture.asset(
                                                            "assets/images/global/reset.svg",
                                                            height: 100,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              const BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                                                          color: ColorStyle.whiteColor,
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                              height: 2,
                                                              color: ColorStyle().grayscaleRange[200],
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                                              child: Center(
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  children: [
                                                                    Text("Logout",
                                                                        style: TypographyStyle.body1SemiBold.copyWith(color: ColorStyle().grayscaleRange[900])),
                                                                    Text("Keluar dari akun",
                                                                        style: TypographyStyle.body3Medium.copyWith(color: ColorStyle().grayscaleRange[500])),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
