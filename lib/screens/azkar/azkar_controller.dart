import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tawba/functions/sound_on_click.dart';
import 'package:tawba/models/zekrModel.dart';
import 'package:tawba/routes/app_routes.dart';
import 'package:tawba/utils/jsons/azkar_data.dart';

class AzkarController extends GetxController {
  RxInt counter = 0.obs;
  RxDouble progressValue = 0.0.obs;
  RxDouble fontSize = 0.0.obs;
  TextEditingController searchController = TextEditingController();
  late PageController pageController;
  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();
    pageController.dispose();
    super.dispose();
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
    soundOnClick();
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

  //otherAzkar
  RxInt itemIndex = 0.obs;
  List<String> azkarTitles = [];
  List<String> getAzkarTitles() {
    allAzkar.forEach((key, value) {
      azkarTitles.add(key);
    });
    update();
    return azkarTitles;
  }

  void onZekrItemPress(int index, List list) {
    resetCounter();
    resetProgressValue();
    itemIndex.value = index;
    getOtherAzkar(index, list);
    Get.toNamed(
      AppRoutes.OTHERAZKARDETAILS,
    );
    update();
  }

  List<ZekrModel> otherAzkar = [];
  List<ZekrModel> getOtherAzkar(
    int index,
    List list,
  ) {
    otherAzkar = [];
    for (var element in allAzkar[list[index]]!) {
      otherAzkar.add(ZekrModel.fromJson(element));
    }
    update();
    return otherAzkar;
  }

//search
  List<String> searchedList = [];
  List<String> getSearchResult(
    String searchText,
  ) {
    searchedList = [];
    allAzkar.forEach((key, value) {
      if (key.contains(searchText)) {
        searchedList.add(key);
      }
    });
    update();
    return searchedList;
  }
}
