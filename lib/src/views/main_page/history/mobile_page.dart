import 'package:absent_payroll/src/core/base_import.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'controller.dart';
import 'list_item.dart';

class HistoryMobilePage extends StatefulWidget {
  const HistoryMobilePage({super.key});

  @override
  State<HistoryMobilePage> createState() => _HistoryMobilePageState();
}

class _HistoryMobilePageState extends State<HistoryMobilePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
      init: HistoryController(),
      builder: (controller) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: (controller.isLoadingStatus)
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
                      header: MaterialHeader(valueColor: AlwaysStoppedAnimation<Color>(ColorStyle.hashMicroGreyColor)),
                      controller: controller.refreshController,
                      // onRefresh: controller.onRefresh,
                      child: SingleChildScrollView(
                        physics: const ScrollPhysics(),
                        child: Column(
                          children: [
                            _header(context, controller),
                            ListView.builder(
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.dosenList.length,
                              itemBuilder: (context, index) {
                                var item = controller.dosenList[index];
                                return ListItem(
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

  Widget _header(BuildContext context, HistoryController controller) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: Get.width,
          height: 36,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "List Status",
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
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Waktu',
                style: TypographyStyle.body1SemiBold.copyWith(color: ColorStyle().grayscaleRange[800]),
              ),
              Text(
                'Latitude',
                textAlign: TextAlign.center,
                style: TypographyStyle.body1SemiBold.copyWith(color: ColorStyle().grayscaleRange[800]),
              ),
              Text(
                'Longitude',
                textAlign: TextAlign.center,
                style: TypographyStyle.body1SemiBold.copyWith(color: ColorStyle().grayscaleRange[800]),
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
