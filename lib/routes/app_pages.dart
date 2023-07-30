import 'package:get/get.dart';
import 'package:tawba/routes/app_routes.dart';
import 'package:tawba/screens/ahadith/ahadith_page.dart';
import 'package:tawba/screens/azkar/azkar_details/azkar_massa_view.dart';
import 'package:tawba/screens/azkar/azkar_details/azkar_sabah_view.dart';
import 'package:tawba/screens/azkar/azkar_details/other_azkar_details.dart';
import 'package:tawba/screens/azkar/azkar_details/other_azkar_view.dart';
import 'package:tawba/screens/azkar/azkar_page.dart';
import 'package:tawba/screens/god_names/god_names_page.dart';
import 'package:tawba/screens/quran/quran_page.dart';
import 'package:tawba/screens/ruqia/ruqia_page.dart';
import 'package:tawba/screens/splash/splash_page.dart';
import '../screens/home/home_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
    ),
    GetPage(
      name: AppRoutes.AZKAR,
      page: () => const AzkarPage(),
    ),
    GetPage(
      name: AppRoutes.AHADITH,
      page: () => const AhadithPage(),
    ),
    GetPage(
      name: AppRoutes.QURAN,
      page: () => const QuranPage(),
    ),
    GetPage(
      name: AppRoutes.RUQIA,
      page: () => const RuqiaPage(),
    ),
    GetPage(
      name: AppRoutes.GODNAMES,
      page: () => const GodNamesPage(),
    ),
    GetPage(
      name: AppRoutes.AZKARSABAH,
      page: () => const AzkarSabahView(),
    ),
    GetPage(
      name: AppRoutes.AZKARMASSA,
      page: () => const AzkarMassaView(),
    ),
    GetPage(
      name: AppRoutes.OTHERAZKAR,
      page: () => const OtherAzkarView(),
    ),
    GetPage(
      name: AppRoutes.OTHERAZKARDETAILS,
      page: () => const OtherAzkarDetails(),
    ),
  ];
}
