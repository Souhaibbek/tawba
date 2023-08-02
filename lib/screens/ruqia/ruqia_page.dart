import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/routes/app_routes.dart';
import 'package:tawba/screens/ruqia/ruqia_controller.dart';
import 'package:tawba/styles/assets.dart';
import 'package:tawba/widgets/global_appbar.dart';
import 'package:tawba/widgets/menu_item_box.dart';

class RuqiaPage extends GetView<RuqiaController> {
  const RuqiaPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RuqiaController());
    return Scaffold(
      appBar: const GlobalAppBar(
        title: 'الرقية الشرعية',
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MenuItemBox(
                  logo: Assets.moshaf,
                  title: "الرقية الشرعية من القرآن الكريم",
                  onTap: () =>
                      Get.toNamed(AppRoutes.RUQIADETAILS, arguments: 0),
                ),
                MenuItemBox(
                  logo: Assets.elsirra2,
                  title: "الرقية الشرعية من السنة النبوية",
                  onTap: () =>
                      Get.toNamed(AppRoutes.RUQIADETAILS, arguments: 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
