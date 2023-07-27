import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/routes/app_routes.dart';
import 'package:tawba/screens/azkar/azkar_controller.dart';
import 'package:tawba/widgets/menu_item_box.dart';
import 'package:tawba/widgets/global_appbar.dart';

class AzkarPage extends GetView<AzkarController> {
  const AzkarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(
        title: 'اذكار المسلم',
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MenuItemBox(
                  title: 'اذكار المساء',
                  onTap: () => Get.toNamed(AppRoutes.AZKARMASSA),
                ),
                MenuItemBox(
                  title: 'اذكار الصباح',
                  onTap: () => Get.toNamed(AppRoutes.AZKARSABAH),
                ),
              ],
            ),
            MenuItemBox(
              title: 'بقيه الاذكار',
              onTap: () => Get.toNamed(AppRoutes.OTHERAZKAR),
            ),
          ],
        ),
      ),
    );
  }
}
