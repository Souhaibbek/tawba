import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:tawba/styles/colors.dart';
import 'package:tawba/styles/styles.dart';
import 'package:tawba/utils/global_variables.dart';
import 'package:tawba/widgets/surah_menu_item.dart';

import 'pdf_controller.dart';

class PdfQuran extends GetView<PdfQuranController> {
  const PdfQuran({super.key});

  @override
  Widget build(BuildContext context) {
    PdfQuranController controller = Get.put(PdfQuranController());
    return Scaffold(
      backgroundColor: Colors.transparent,
      key: controller.scaffoldKey,
      endDrawer: Drawer(
        width: MediaQuery.of(context).size.width / 2.5,
        elevation: 20,
        shadowColor: AppColors.kprimarygradientColor1,
        surfaceTintColor: Colors.black,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: Colors.transparent,
        child: ListView.builder(
          itemCount: controller.quranList.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.changePage(controller.quranList[index].page - 1);
                  },
                  child: SurahMenuItem(
                    color: Colors.transparent,
                    title: controller.quranList[index].title,
                    type: controller.quranList[index].type,
                    length: controller.quranList[index].count,
                    titleStyle: AppTextStyles.suraTitleTextStyle2,
                    descStyle: AppTextStyles.referenceTextStyle2,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      body: SafeArea(
          child: GestureDetector(
        onTap: () {
          controller.scaffoldKey.currentState!.openEndDrawer();
        },
        child: PdfViewPinch(
          controller: controller.pdfPinchController,
          scrollDirection: Axis.vertical,
          onPageChanged: (page) {
            initPage = page;
          },
        ),
      )),
    );
  }
}
