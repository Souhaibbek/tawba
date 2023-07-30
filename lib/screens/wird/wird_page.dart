import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/widgets/global_appbar.dart';
import 'package:tawba/widgets/wird_item_widget.dart';
import 'wird_controller.dart';

class WirdPage extends GetView<WirdController> {
  const WirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WirdController());
    return Scaffold(
      appBar: const GlobalAppBar(
        title: 'وردي اليومي',
      ),
      body: GetBuilder(
        init: WirdController(),
        initState: (_) {
          controller.getwirdList();
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
              itemBuilder: (context, index) => WirdItemWidget(
                onTap: () {
                  controller.changePage(
                    controller.wirdList[index].counter,
                  );
                },
                min: true,
                size: controller.fontSize.value,
                restart: () => controller.resetPages(),
                addSize: () => controller.addSize(),
                lowSize: () => controller.lowSize(),
                progressValue: controller.progressValue.value,
                count: controller.wirdList[index].count,
                length: controller.wirdList.length,
                counter: controller.clicksNumber.value,
                wirdText: controller.wirdList[index].text,
                pos: index + 1,
              ),
              itemCount: controller.wirdList.length,
            ),
          );
        },
      ),
    );
  }
}
