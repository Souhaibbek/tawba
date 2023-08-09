import 'package:get/get.dart';
import 'package:tawba/screens/qiblah/qiblah_controller.dart';

class QiblahBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QiblahController>(() => QiblahController());
  }
}
