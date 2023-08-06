import 'package:get/get.dart';
import 'package:tawba/screens/ahadith/ahadith_controller.dart';

class AlHadithBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AhadithController>(() => AhadithController());
  }
}
