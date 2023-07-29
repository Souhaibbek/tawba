import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/widgets/global_appbar.dart';
import 'package:tawba/widgets/hadith_item_widget.dart';
import 'ahadith_controller.dart';

class AhadithPage extends GetView<AhadithController> {
  const AhadithPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AhadithController());
    return Scaffold(
      appBar: const GlobalAppBar(
        title: 'احاديث نبوية',
      ),
      body: GetBuilder(
        init: AhadithController(),
        initState: (_) {
          controller.getHadith();
        },
        builder: (controller) {
          return Align(
            alignment: Alignment.center,
            child: PageView.builder(
              onPageChanged: (value) {},
              controller: controller.pageController,
              physics: const BouncingScrollPhysics(),
              reverse: true,
              itemBuilder: (context, index) => HadithItemWidget(
                onTap: () {
                  controller.changePage();
                },
                size: controller.fontSize.value,
                restart: () => controller.resetPages(),
                addSize: () => controller.addSize(),
                lowSize: () => controller.lowSize(),
                hadithText: controller.hadithList[index].hadithText,
                description: controller.hadithList[index].description,
              ),
              itemCount: controller.hadithList.length,
            ),
          );
        },
      ),
    );
  }
}
