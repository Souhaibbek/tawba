import 'package:get/get.dart';
import 'package:tawba/screens/pdf/pdf_controller.dart';

class PdfQrBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PdfQuranController>(() => PdfQuranController());
  }
}
