import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/screens/ruqia/ruqia_controller.dart';
import 'package:tawba/widgets/global_appbar.dart';
import 'package:tawba/widgets/zekr_item_widgets.dart';

class RuqiaPage extends GetView<RuqiaController> {
  const RuqiaPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RuqiaController());
    return Scaffold(
      appBar: const GlobalAppBar(
        title: 'الرقية الشرعية',
      ),
      body: GetBuilder(
        init: RuqiaController(),
        initState: (_) {
          controller.getRuqiaList();
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
                onTap: () {
                  controller.changePage(
                    controller.ruqiaList[index].countNumber,
                  );
                },
                min: true,
                size: controller.fontSize.value,
                restart: () => controller.resetPages(),
                addSize: () => controller.addSize(),
                lowSize: () => controller.lowSize(),
                progressValue: controller.progressValue.value,
                zekr: controller.ruqiaList[index].zekr,
                count: controller.ruqiaList[index].count,
                desc: controller.ruqiaList[index].desc,
                ref: controller.ruqiaList[index].ref,
                countNumber: controller.counter.value,
                length: controller.ruqiaList.length,
                pos: index + 1,
              ),
              itemCount: controller.ruqiaList.length,
            ),
          );
        },
      ),
    );
  }
}
