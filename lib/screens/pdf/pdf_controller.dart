import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:tawba/models/quranmodel.dart';
import 'package:tawba/services/shared_pref.dart';
import 'package:tawba/styles/assets.dart';
import 'package:tawba/utils/global_variables.dart';
import 'package:tawba/utils/jsons/quran_text.dart';

class PdfQuranController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late final PdfControllerPinch pdfController;
  RxInt allPagesCount = 0.obs;
  RxInt currentPage = 0.obs;
  RxString currentSura = 'الفاتحه'.obs;
  @override
  void onInit() async {
    getQuranInfo();

    pdfController = PdfControllerPinch(
        document: PdfDocument.openAsset(Assets.pdfQR), initialPage: initValue!);
    currentPage.value = await SharedPrefHelper.getInt(key: 'index') ?? 0;
    currentSura.value =
        await SharedPrefHelper.getString(key: 'currentSura') ?? 'الفاتحه';
    super.onInit();
  }

  @override
  void dispose() {
    pdfController.dispose();

    super.dispose();
  }

  void getAllPageCount(int docLength) {
    allPagesCount.value = docLength;
    update();
  }

  List<QuranModel> quranList = [];
  List<QuranModel> getQuranInfo() {
    for (var item in myQuranText) {
      quranList.add(QuranModel.fromJson(item));
    }
    update();

    return quranList;
  }

  void changePage(int index) async {
    if (index != 1) {
      await SharedPrefHelper.saveInt(key: 'index', value: index);
      for (var i = 0; i < quranList.length; i++) {
        if (quranList[i].page == index) {
          currentSura.value = quranList[i].title;
        }
        if (currentSura.value == quranList[i].title &&
            index < quranList[i].page) {
          currentSura.value = quranList[i - 1].title;
        }
      }
      initValue = index;
      await SharedPrefHelper.saveString(
          key: 'currentSura', value: currentSura.value);

      currentPage.value = index;
    }
  }

  void jumpToPage(int pageIndex, int suraIndex) async {
    await SharedPrefHelper.saveInt(key: 'index', value: pageIndex);
    await SharedPrefHelper.saveString(
        key: 'currentSura', value: currentSura.value);

    initValue = pageIndex;

    currentSura.value = quranList[suraIndex].title;
    currentPage.value = pageIndex;

    pdfController.jumpToPage(pageIndex - 1);
    scaffoldKey.currentState!.closeEndDrawer();
  }
}
