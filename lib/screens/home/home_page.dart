import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/routes/app_routes.dart';
import 'package:tawba/screens/home/home_controller.dart';
import 'package:tawba/styles/assets.dart';
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MenuItemBox(
                    logo: Assets.quranLogo,
                    title: 'القرآن الكريم',
                    onTap: () => Get.toNamed(AppRoutes.QURAN),
                  ),
                  MenuItemBox(
                    logo: Assets.doa2,
                    title: 'اذكار المسلم',
                    onTap: () => Get.toNamed(AppRoutes.AZKAR),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MenuItemBox(
                    logo: Assets.godnameLogo,
                    title: 'اسماء الله الحسنه',
                    onTap: () => Get.toNamed(AppRoutes.GODNAMES),
                  ),
                  MenuItemBox(
                    logo: Assets.elsirra,
                    title: 'احاديث نبوية',
                    onTap: () => Get.toNamed(AppRoutes.AHADITH),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MenuItemBox(
                    logo: Assets.ruqiaLogo,
                    title: 'الرقية الشرعية',
                    onTap: () => Get.toNamed(AppRoutes.RUQIA),
                  ),
                  MenuItemBox(
                    logo: Assets.wirdLogo,
                    title: 'الورد اليومي',
                    onTap: () => Get.toNamed(AppRoutes.WIRD),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
