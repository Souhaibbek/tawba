import 'package:get/get.dart';
import 'package:tawba/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await navigate();
    super.onInit();
  }

  Future navigate() async {
    Future.delayed(
      const Duration(milliseconds: 3000),
      () => Get.offNamed(
        AppRoutes.HOME,
      ),
    );
  }
}
