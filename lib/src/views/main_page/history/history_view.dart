import 'package:absent_payroll/src/core/base_import.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'history_controller.dart';
import 'history_list_item.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
      init: HistoryController(),
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
                            if (controller.absentList.isEmpty)
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Center(
                                  child: Text(
                                    'Data tidak ditemukan',
                                    style: TypographyStyle.body2Reguler.copyWith(color: ColorStyle().grayscaleRange[800]),
                                  ),
                                ),
                              )
                            else if (controller.isLoadingHistory)
                              CircularProgressIndicator()
                            else
                              ListView.builder(
                                physics: const ScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.absentList.length,
                                itemBuilder: (context, index) {
                                  var item = controller.absentList[index];
                                  return HistoryListItem(
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
              "Riwayat Absensi",
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
          padding: const EdgeInsets.symmetric(horizontal: 12),
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
                  'Check In',
                  textAlign: TextAlign.center,
                  style: TypographyStyle.body2SemiBold.copyWith(color: ColorStyle().grayscaleRange[800]),
                ),
              ),
              Expanded(
                child: Text(
                  'Check Out',
                  textAlign: TextAlign.center,
                  style: TypographyStyle.body2SemiBold.copyWith(color: ColorStyle().grayscaleRange[800]),
                ),
              ),
              Expanded(
                child: Text(
                  'Status',
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
