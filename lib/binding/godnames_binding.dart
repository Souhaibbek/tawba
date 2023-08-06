import 'package:get/get.dart';
import 'package:tawba/screens/god_names/god_names_controller.dart';

class GodNamesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GodNamesController>(() => GodNamesController());
  }
}
