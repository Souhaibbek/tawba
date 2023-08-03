import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/screens/azkar/azkar_controller.dart';
import 'package:tawba/widgets/global_appbar.dart';
import 'package:tawba/widgets/zekr_item_widgets.dart';

class OtherAzkarDetails extends GetView<AzkarController> {
  const OtherAzkarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AzkarController());

    return Scaffold(
      appBar: GlobalAppBar(
        title: (controller.searchedList.isNotEmpty)
            ? controller.searchedList[controller.itemIndex.value]
            : controller.azkarTitles[controller.itemIndex.value],
      ),
      body: GetBuilder(
        init: AzkarController(),
        initState: (_) {},
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
                    controller.otherAzkar[index].countNumber,
                  );
                },
                min: true,
                size: controller.fontSize.value,
                restart: () => controller.resetPages(),
                addSize: () => controller.addSize(),
                lowSize: () => controller.lowSize(),
                progressValue: controller.progressValue.value,
                zekr: controller.otherAzkar[index].zekr,
                count: controller.otherAzkar[index].count,
                countNumber: controller.counter.value,
                length: controller.otherAzkar.length,
                pos: index + 1,
              ),
              itemCount: controller.otherAzkar.length,
            ),
          );
        },
      ),
    );
  }
}
