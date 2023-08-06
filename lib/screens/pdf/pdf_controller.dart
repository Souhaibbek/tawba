import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:tawba/models/quranmodel.dart';
import 'package:tawba/services/shared_pref.dart';
import 'package:tawba/styles/assets.dart';
import 'package:tawba/utils/global_variables.dart';
import 'package:tawba/utils/quran_text.dart';

class PdfQuranController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late final PdfControllerPinch pdfPinchController;

  @override
  void onInit() async {
    getQuranInfo();
    pdfPinchController = PdfControllerPinch(
        document: PdfDocument.openAsset(Assets.pdfQR), initialPage: initValue!);
    super.onInit();
  }

  void jumpToPage(int index) async {
    await SharedPrefHelper.saveInt(key: 'index', value: index);
    initValue = index;
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

  void changePage(int index) async {
    if (index > 1) {
      await SharedPrefHelper.saveInt(key: 'index', value: index);
      initValue = index;
      update();
    }
  }
}
