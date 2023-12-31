import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/routes/app_routes.dart';
import 'package:tawba/styles/assets.dart';
import 'package:tawba/styles/colors.dart';
import 'package:tawba/widgets/global_appbar.dart';
import 'package:tawba/widgets/menu_item_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: 'الرئيسية',
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications),
          color: AppColors.kWhiteColor,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Wrap(
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
                MenuItemBox(
                  logo: Assets.salatLogo,
                  title: 'اوقات الصلاة',
                  onTap: () => Get.toNamed(AppRoutes.PRAYER),
                ),
                MenuItemBox(
                  logo: Assets.elsirra,
                  title: 'احاديث نبوية',
                  onTap: () => Get.toNamed(AppRoutes.AHADITH),
                ),
                MenuItemBox(
                  logo: Assets.moshaf,
                  title: 'الورد اليومي',
                  onTap: () => Get.toNamed(AppRoutes.WIRD),
                ),
                MenuItemBox(
                  logo: Assets.ruqiaLogo,
                  title: 'الرقية الشرعية',
                  onTap: () => Get.toNamed(AppRoutes.RUQIA),
                ),
                MenuItemBox(
                  logo: Assets.godnameLogo,
                  title: 'اسماء الله الحسنه',
                  onTap: () => Get.toNamed(AppRoutes.GODNAMES),
                ),
                MenuItemBox(
                  logo: Assets.wirdLogo,
                  title: 'القرآن الكريم' "\nPDF",
                  onTap: () => Get.toNamed(AppRoutes.PDFQURAN),
                ),
                MenuItemBox(
                  logo: Assets.sebhaicon,
                  title: "السبحة",
                  onTap: () => Get.toNamed(AppRoutes.TASBIH),
                ),
                MenuItemBox(
                  logo: Assets.qiblaicon,
                  title: "القبلة",
                  onTap: () => Get.toNamed(AppRoutes.QIBLAH),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
