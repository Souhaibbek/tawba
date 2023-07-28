import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/screens/azkar/azkar_controller.dart';
import 'package:tawba/widgets/global_appbar.dart';
import 'package:tawba/widgets/zekr_item_widgets.dart';

class AzkarMassaView extends GetView<AzkarController> {
  const AzkarMassaView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AzkarController());
    return Scaffold(
      appBar: const GlobalAppBar(
        title: 'اذكار المساء',
      ),
      body: GetBuilder(
        init: AzkarController(),
        initState: (_) {
          controller.getZekrMassa();
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
                    controller.zekrMassa[index].countNumber,
                  );
                },
                size: controller.fontSize.value,
                restart: () => controller.resetPages(),
                addSize: () => controller.addSize(),
                lowSize: () => controller.lowSize(),
                progressValue: controller.progressValue.value,
                zekr: controller.zekrMassa[index].zekr,
                count: controller.zekrMassa[index].count,
                desc: controller.zekrMassa[index].desc,
                ref: controller.zekrMassa[index].ref,
                countNumber: controller.counter.value,
                length: controller.zekrMassa.length,
                pos: index + 1,
              ),
              itemCount: controller.zekrMassa.length,
            ),
          );
        },
      ),
    );
  }
}
