import 'package:get/get.dart';
import 'package:tawba/binding/alhadith_binding.dart';
import 'package:tawba/binding/azkar_binding.dart';
import 'package:tawba/binding/godnames_binding.dart';
import 'package:tawba/binding/home_binding.dart';
import 'package:tawba/binding/pdfqr_binding.dart';
import 'package:tawba/binding/prayer_binding.dart';
import 'package:tawba/binding/quran_binding.dart';
import 'package:tawba/binding/ruqia_binding.dart';
import 'package:tawba/binding/splash_binding.dart';
import 'package:tawba/binding/wird_binding.dart';
import 'package:tawba/routes/app_routes.dart';
import 'package:tawba/screens/ahadith/ahadith_page.dart';
import 'package:tawba/screens/azkar/azkar_details/azkar_massa_view.dart';
import 'package:tawba/screens/azkar/azkar_details/azkar_sabah_view.dart';
import 'package:tawba/screens/azkar/azkar_details/other_azkar_details.dart';
import 'package:tawba/screens/azkar/azkar_details/other_azkar_view.dart';
import 'package:tawba/screens/azkar/azkar_page.dart';
import 'package:tawba/screens/god_names/god_names_page.dart';
import 'package:tawba/screens/pdf/pdf_page.dart';
import 'package:tawba/screens/prayer/prayer_page.dart';
import 'package:tawba/screens/quran/font_size_settings.dart';
import 'package:tawba/screens/quran/quran_page.dart';
import 'package:tawba/screens/quran/surah_page.dart';
import 'package:tawba/screens/ruqia/ruqia_details_view.dart';
import 'package:tawba/screens/ruqia/ruqia_page.dart';
import 'package:tawba/screens/splash/splash_page.dart';
import 'package:tawba/screens/wird/wird_page.dart';
import '../screens/home/home_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      binding: SplashBinding(),
      name: AppRoutes.SPLASH,
      page: () => const SplashPage(),
    ),
    GetPage(
      binding: HomeBinding(),
      name: AppRoutes.HOME,
      page: () => const HomePage(),
    ),
    GetPage(
      binding: AzkarBinding(),
      name: AppRoutes.AZKAR,
      page: () => const AzkarPage(),
    ),
    GetPage(
      binding: AlHadithBinding(),
      name: AppRoutes.AHADITH,
      page: () => const AhadithPage(),
    ),
    GetPage(
      binding: QuranBinding(),
      name: AppRoutes.QURAN,
      page: () => const QuranPage(),
    ),
    GetPage(
      binding: QuranBinding(),
      name: AppRoutes.SURAH,
      page: () => const SurahPage(),
    ),
    GetPage(
      binding: QuranBinding(),
      name: AppRoutes.FONTSIZESETTINGS,
      page: () => const FontSizeSettings(),
    ),
    GetPage(
      binding: RuqiaBinding(),
      name: AppRoutes.RUQIA,
      page: () => const RuqiaPage(),
    ),
    GetPage(
      binding: RuqiaBinding(),
      name: AppRoutes.RUQIADETAILS,
      page: () => const RuqiaDetailsView(),
    ),
    GetPage(
      binding: WirdBinding(),
      name: AppRoutes.WIRD,
      page: () => const WirdPage(),
    ),
    GetPage(
      binding: GodNamesBinding(),
      name: AppRoutes.GODNAMES,
      page: () => const GodNamesPage(),
    ),
    GetPage(
      binding: AzkarBinding(),
      name: AppRoutes.AZKARSABAH,
      page: () => const AzkarSabahView(),
    ),
    GetPage(
      binding: AzkarBinding(),
      name: AppRoutes.AZKARMASSA,
      page: () => const AzkarMassaView(),
    ),
    GetPage(
      binding: AzkarBinding(),
      name: AppRoutes.OTHERAZKAR,
      page: () => const OtherAzkarView(),
    ),
    GetPage(
      binding: AzkarBinding(),
      name: AppRoutes.OTHERAZKARDETAILS,
      page: () => const OtherAzkarDetails(),
    ),
    GetPage(
      binding: PdfQrBinding(),
      name: AppRoutes.PDFQURAN,
      page: () => const PdfQuran(),
    ),
    GetPage(
      binding: PrayerBinding(),
      name: AppRoutes.PRAYER,
      page: () => const PrayerPage(),
    ),
  ];
}
