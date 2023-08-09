import 'package:get/get.dart';
import 'package:tawba/screens/tasbih/tasbih_controller.dart';

class TasbihBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TasbihController>(() => TasbihController());
  }
}
