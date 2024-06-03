import 'package:absent_payroll/src/core/base_import.dart';
import 'package:absent_payroll/src/views/main_page/about/about_controller.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutController>(
      init: AboutController(),
      builder: (controller) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorStyle.whiteColor,
            systemOverlayStyle: SystemUiOverlayStyle(
              // Android
              statusBarColor: ColorStyle.whiteColor,
              statusBarIconBrightness: Brightness.dark,
              // iOS
              statusBarBrightness: Brightness.light,
              systemNavigationBarIconBrightness: Brightness.dark,
              systemNavigationBarDividerColor: ColorStyle.whiteColor,
            ),
            leading: const SizedBox.shrink(),
            title: Text(
              "Tentang Hash Micro",
              style: TypographyStyle.body2SemiBold.copyWith(color: ColorStyle().grayscaleRange[900]),
              textAlign: TextAlign.center,
            ),
            elevation: 0,
            centerTitle: true,
          ),
          body: Container(
            color: ColorStyle.whiteColor,
            width: Get.width,
            height: Get.height,
            child: ScrollConfiguration(
              behavior: CustomDisableGlowBehavior(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 2,
                      color: ColorStyle().grayscaleRange[200],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        "Hash Micro",
                        style: TypographyStyle.body1Bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Text(
                        "Sebagai penyedia solusi ERP terbaik, kami menyadari betapa pentingnya produktivitas dan efisiensi. Solusi otomatis yang mendukung kegiatan operasional bisnis dapat memaksimalkan potensi perusahaan dan bersaing di pasar global. Oleh karena itu, pada 2015 lalu, kami mengambil kesempatan ini untuk membangun sebuah sistem berbasis cloud yang mengotomatiskan proses end-to-end operasi bisnis.",
                        style: TypographyStyle.body4Medium.copyWith(color: ColorStyle().grayscaleRange[700]),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Text(
                        "Kami mengerti bahwa setiap perusahaan memiliki cara kerja yang unik. Kemampuan kami dalam membangun sebuah sistem yang dapat disesuaikan dengan kebutuhan klien adalah alasan mengapa kami dipercaya oleh lebih dari 1750 bisnis di Indonesia. Hal ini terus memotivasi kami untuk membawa manfaat dari software ERP ke jenis industri lain dengan solusi yang inovatif. Bagi kami, terus berkembang adalah kunci agar terus bisa memberikan dampak positif di ranah enterprise.",
                        style: TypographyStyle.body4Medium.copyWith(color: ColorStyle().grayscaleRange[700]),
                      ),
                    )
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
