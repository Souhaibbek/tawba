import 'package:get/get.dart';
import 'package:tawba/screens/prayer/prayer_controller.dart';

class PrayerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrayerController>(() => PrayerController());
  }
}
