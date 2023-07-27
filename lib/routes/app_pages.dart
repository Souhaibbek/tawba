import 'package:get/get.dart';
import 'package:tawba/routes/app_routes.dart';
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
  ];
}
