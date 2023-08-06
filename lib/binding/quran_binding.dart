import 'package:get/get.dart';
import 'package:tawba/screens/quran/quran_controller.dart';

class QuranBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuranController>(() => QuranController());
  }
}
