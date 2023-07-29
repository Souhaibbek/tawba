import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tawba/models/hadithmodel.dart';
import 'package:tawba/utils/hadith_text.dart';

class AhadithController extends GetxController {
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
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );
    update();
  }

  List<HadithModel> hadithList = [];
  List<HadithModel> getHadith() {
    for (var item in hadith) {
      hadithList.add(HadithModel.fromJson(item));
    }
    log(hadithList[1].hadithText);
    update();
    return hadithList;
  }
}
