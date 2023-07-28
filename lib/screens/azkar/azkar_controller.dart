import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tawba/models/zekrModel.dart';
import 'package:tawba/utils/azkar_data.dart';

class AzkarController extends GetxController {
  RxInt counter = 0.obs;
  RxDouble progressValue = 0.0.obs;
  late PageController pageController;
  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  void resetCounter() {
    counter.value = 0;
    update();
  }

  void resetProgressValue() {
    progressValue.value = 0;
    update();
  }

  void changePage(int number) {
    counter.value++;
    progressValue.value = ((counter * 100) / number) / 100;
    if (counter.value >= number) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 1500),
          curve: Curves.decelerate);
    }
    update();
  }

  //azkarSabah
  List<ZekrModel> zekrSabah = [];
  List<ZekrModel> getZekrSabah() {
    for (var item in azkarSabah) {
      zekrSabah.add(ZekrModel.fromJson(item));
    }
    update();
    return zekrSabah;
  }

  //azkarMassa
  List<ZekrModel> zekrMassa = [];
  List<ZekrModel> getZekrMassa() {
    for (var item in azkarMassa) {
      zekrMassa.add(ZekrModel.fromJson(item));
    }
    update();
    return zekrMassa;
  }
}
