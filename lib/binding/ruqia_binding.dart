import 'package:get/get.dart';
import 'package:tawba/screens/ruqia/ruqia_controller.dart';

class RuqiaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RuqiaController>(() => RuqiaController());
  }
}
