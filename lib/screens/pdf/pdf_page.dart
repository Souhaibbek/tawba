import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:tawba/styles/colors.dart';
import 'package:tawba/styles/styles.dart';
import 'package:tawba/widgets/surah_menu_item.dart';
import 'pdf_controller.dart';

class PdfQuran extends GetView<PdfQuranController> {
  const PdfQuran({super.key});

  @override
  Widget build(BuildContext context) {
    PdfQuranController controller = Get.put(PdfQuranController());
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(8),
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.kprimarygradientColor1.withOpacity(0.85),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Text(
                  'عدد الصفحات:${controller.allPagesCount.value}',
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.descriptionTextStyle,
                ),
              ),
              Obx(
                () => Text(
                  controller.currentSura.value,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.descriptionTextStyle,
                ),
              ),
              Obx(
                () => Text(
                  'الصفحة الحالية:${controller.currentPage.value}',
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.descriptionTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
      key: controller.scaffoldKey,
      endDrawer: Drawer(
        width: MediaQuery.of(context).size.width / 2,
        elevation: 20,
        shadowColor: AppColors.kprimarygradientColor1,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: Colors.transparent,
        child: ListView.separated(
          itemCount: controller.quranList.length,
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              height: 1,
              color: AppColors.kYellowColor.withOpacity(0.2),
            ),
          ),
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.jumpToPage(
                        controller.quranList[index].page, index);
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
      body: Stack(
        children: [
          GestureDetector(
            onHorizontalDragEnd: (_) {
              controller.scaffoldKey.currentState!.openEndDrawer();
            },
            child: PdfViewPinch(
              backgroundDecoration: const BoxDecoration(
                color: AppColors.kWhiteColor,
              ),
              padding: 10,
              controller: controller.pdfController,
              scrollDirection: Axis.vertical,
              onPageChanged: (index) {
                controller.changePage(index);
              },
              onDocumentLoaded: (document) {
                controller.getAllPageCount(document.pagesCount);
              },
            ),
          ),
        ],
      ),
    );
  }
}
