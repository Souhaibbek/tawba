import 'package:get/get.dart';
import 'package:tawba/screens/azkar/azkar_controller.dart';

class AzkarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AzkarController>(() => AzkarController());
  }
}
