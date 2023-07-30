import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/routes/app_routes.dart';
import 'package:tawba/screens/home/home_controller.dart';
import 'package:tawba/widgets/global_appbar.dart';

import '../../widgets/menu_item_box.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(
        title: 'الرئيسية',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MenuItemBox(
                title: 'القرآن الكريم',
                onTap: () => Get.toNamed(AppRoutes.QURAN),
              ),
              MenuItemBox(
                title: 'اذكار المسلم',
                onTap: () => Get.toNamed(AppRoutes.AZKAR),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MenuItemBox(
                title: 'اسماء الله الحسنه',
                onTap: () => Get.toNamed(AppRoutes.GODNAMES),
              ),
              MenuItemBox(
                title: 'احاديث نبوية',
                onTap: () => Get.toNamed(AppRoutes.AHADITH),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MenuItemBox(
                title: 'الرقية الشرعية',
                onTap: () => Get.toNamed(AppRoutes.RUQIA),
              ),
              MenuItemBox(
                title: 'الورد اليومي',
                onTap: () => Get.toNamed(AppRoutes.WIRD),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
