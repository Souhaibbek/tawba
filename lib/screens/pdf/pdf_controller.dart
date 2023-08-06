import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:tawba/models/quranmodel.dart';
import 'package:tawba/styles/assets.dart';
import 'package:tawba/utils/global_variables.dart';
import 'package:tawba/utils/quran_text.dart';

class PdfQuranController extends GetxController {
  RxInt initialIndex = initPage.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late final PdfControllerPinch pdfPinchController;

  @override
  void onInit() {
    getQuranInfo();
    pdfPinchController = PdfControllerPinch(
        document: PdfDocument.openAsset(Assets.pdfQR),
        initialPage: initialIndex.value);
    super.onInit();
  }

  @override
  void dispose() {
    pdfPinchController.dispose();
    super.dispose();
  }

  void changePage(int index) {
    initPage = index;
    pdfPinchController.jumpToPage(index);
    scaffoldKey.currentState!.closeEndDrawer();
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
}
