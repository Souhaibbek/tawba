import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/models/zekrModel.dart';
import 'package:tawba/utils/jsons/jsons/ruqia_text.dart';

class RuqiaController extends GetxController {
  RxInt counter = 0.obs;
  RxDouble progressValue = 0.0.obs;
  RxDouble fontSize = 0.0.obs;
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

  void addSize() {
    fontSize.value++;
    update();
  }

  void lowSize() {
    fontSize.value--;
    update();
  }

  void resetPages() {
    pageController.jumpToPage(0);
    resetSize();
    update();
  }

  void resetSize() {
    fontSize.value = 0;
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
        duration: const Duration(milliseconds: 500),
        curve: Curves.decelerate,
      );
    }
    update();
  }

  //azkarSabah
  List<ZekrModel> ruqiaList = [];
  List<ZekrModel> getRuqiaList() {
    for (var item in ruqia) {
      ruqiaList.add(ZekrModel.fromJson(item));
    }
    update();
    return ruqiaList;
  }
}
