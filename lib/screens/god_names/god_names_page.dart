import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/screens/god_names/god_names_controller.dart';
import 'package:tawba/widgets/global_appbar.dart';
import 'package:tawba/widgets/god_names_item_widget.dart';

class GodNamesPage extends GetView<GodNamesController> {
  const GodNamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GodNamesController());
    return Scaffold(
      appBar: const GlobalAppBar(
        title: 'اسماء الله الحسنه',
      ),
      body: GetBuilder(
        init: GodNamesController(),
        initState: (_) {
          controller.getGodNames();
        },
        builder: (controller) {
          return Align(
            alignment: Alignment.center,
            child: PageView.builder(
              onPageChanged: (value) {},
              controller: controller.pageController,
              physics: const BouncingScrollPhysics(),
              reverse: true,
              itemBuilder: (context, index) => GodNamesItemWidget(
                onTap: () {
                  controller.changePage();
                },
                size: controller.fontSize.value,
                restart: () => controller.resetPages(),
                addSize: () => controller.addSize(),
                lowSize: () => controller.lowSize(),
                name: controller.godNamesList[index].name,
                desc: controller.godNamesList[index].descText,
              ),
              itemCount: controller.godNamesList.length,
            ),
          );
        },
      ),
    );
  }
}
