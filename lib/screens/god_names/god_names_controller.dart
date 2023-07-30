import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/functions/sound_on_click.dart';
import 'package:tawba/models/godnamesmodel.dart';
import 'package:tawba/utils/god_name_text.dart';

class GodNamesController extends GetxController {
  RxDouble fontSize = 0.0.obs;
  late PageController pageController;
  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
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

  List<GodNamesModel> godNamesList = [];
  List<GodNamesModel> getGodNames() {
    for (var item in godNames) {
      godNamesList.add(GodNamesModel.fromJson(item));
    }

    update();
    return godNamesList;
  }
}
