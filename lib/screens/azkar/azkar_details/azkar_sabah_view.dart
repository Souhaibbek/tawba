import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/screens/azkar/azkar_controller.dart';
import 'package:tawba/widgets/global_appbar.dart';
import 'package:tawba/widgets/zekr_item_widgets.dart';

class AzkarSabahView extends GetView<AzkarController> {
  const AzkarSabahView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AzkarController());
    return Scaffold(
      appBar: const GlobalAppBar(
        title: 'اذكار الصباح',
      ),
      body: GetBuilder(
        init: AzkarController(),
        initState: (_) {
          controller.getZekrSabah();
        },
        builder: (controller) {
          return Align(
            alignment: Alignment.center,
            child: PageView.builder(
              reverse: true,
              itemBuilder: (context, index) => ZekrItemWidget(
                zekr: controller.zekrSabah[index].zekr,
                count: controller.zekrSabah[index].count,
                desc: controller.zekrSabah[index].desc,
                ref: controller.zekrSabah[index].ref,
                countNumber: controller.zekrSabah[index].countNumber,
                length: controller.zekrSabah.length,
                pos: index,
              ),
              itemCount: controller.zekrSabah.length,
            ),
          );
        },
      ),
    );
  }
}
