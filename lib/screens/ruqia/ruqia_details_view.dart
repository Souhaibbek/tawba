import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/screens/ruqia/ruqia_controller.dart';
import 'package:tawba/widgets/global_appbar.dart';
import 'package:tawba/widgets/zekr_item_widgets.dart';

class RuqiaDetailsView extends GetView<RuqiaController> {
  const RuqiaDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    int page = Get.arguments;
    Get.put(RuqiaController());
    return Scaffold(
      appBar: GlobalAppBar(
        title: (page == 0)
            ? "الرقية الشرعية من القرآن الكريم"
            : "الرقية الشرعية من السنة النبوية",
      ),
      body: GetBuilder(
        init: RuqiaController(),
        initState: (_) {
          controller.getRuqiaData(page);
          controller.resetCounter();
          controller.resetProgressValue();
        },
        builder: (controller) {
          return Align(
            alignment: Alignment.center,
            child: PageView.builder(
              onPageChanged: (value) {
                controller.resetCounter();
                controller.resetProgressValue();
              },
              controller: controller.pageController,
              physics: const BouncingScrollPhysics(),
              reverse: true,
              itemBuilder: (context, index) => ZekrItemWidget(
                min: true,
                size: controller.fontSize.value,
                restart: () => controller.resetPages(),
                addSize: () => controller.addSize(),
                lowSize: () => controller.lowSize(),
                progressValue: controller.progressValue.value,
                zekr: controller.ruqiaData[index].zekr,
                count: controller.ruqiaData[index].count,
                countNumber: controller.counter.value,
                length: controller.ruqiaData.length,
                pos: index + 1,
                onTap: () {
                  controller.changePage(
                    controller.ruqiaData[index].countNumber,
                  );
                },
              ),
              itemCount: controller.ruqiaData.length,
            ),
          );
        },
      ),
    );
  }
}
