import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/models/WirdModel.dart';

import 'package:tawba/utils/wird.dart';

class WirdController extends GetxController {
  RxInt clicksNumber = 0.obs;
  RxDouble progressValue = 0.0.obs;
  RxDouble fontSize = 0.0.obs;
  late PageController pageController;
  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  void resetCounter() {
    clicksNumber.value = 0;
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
    clicksNumber.value++;
    progressValue.value = ((clicksNumber * 100) / number) / 100;
    if (clicksNumber.value >= number) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.decelerate,
      );
    }
    update();
  }

  //wirdList
  List<WirdModel> wirdList = [];
  List<WirdModel> getwirdList() {
    for (var item in wird) {
      wirdList.add(WirdModel.fromJson(item));
    }
    update();
    return wirdList;
  }
}
