import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tawba/functions/sound_on_click.dart';
import 'package:tawba/models/hadithmodel.dart';
import 'package:tawba/utils/hadith_text.dart';

class AhadithController extends GetxController {
  RxDouble fontSize = 0.0.obs;
  late PageController pageController;
  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
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

  void changePage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );
    soundOnClick();
    update();
  }

  List<HadithModel> hadithList = [];
  List<HadithModel> getHadith() {
    for (var item in hadith) {
      hadithList.add(HadithModel.fromJson(item));
    }
    update();
    return hadithList;
  }
}
