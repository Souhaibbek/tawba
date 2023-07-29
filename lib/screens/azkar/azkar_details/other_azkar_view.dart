import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/screens/azkar/azkar_controller.dart';
import 'package:tawba/widgets/azkar_title_menu_item.dart';
import 'package:tawba/widgets/global_appbar.dart';

class OtherAzkarView extends GetView<AzkarController> {
  const OtherAzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AzkarController());
    return Scaffold(
      appBar: const GlobalAppBar(
        title: 'بقيه الاذكار',
      ),
      body: GetBuilder(
        init: AzkarController(),
        initState: (state) {
          controller.getAzkarTitles();
        },
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: ListView.builder(
                  itemCount: controller.azkarTitles.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        controller.onZekrItemPress(index);
                      },
                      child: AzkarTitleMenuItem(
                          title: controller.azkarTitles[index]),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
