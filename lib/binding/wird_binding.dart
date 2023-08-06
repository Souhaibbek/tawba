import 'package:get/get.dart';
import 'package:tawba/screens/wird/wird_controller.dart';

class WirdBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WirdController>(() => WirdController());
  }
}
