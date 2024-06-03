import 'package:absent_payroll/src/core/base_import.dart';

TextEditingController _pageController = TextEditingController();

Future<void> showDebugConsole(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('System Console'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Page Launcher"),
                      TextField(
                        controller: _pageController,
                        decoration: const InputDecoration(hintText: "Route Name"),
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        height: 40,
                        onPressed: () => Get.toNamed(_pageController.text),
                        radius: 100,
                        width: 150,
                        child: Text(
                          'Go',
                          style: TypographyStyle.body1Bold.copyWith(color: ColorStyle.whiteColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
