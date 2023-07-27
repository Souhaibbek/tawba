import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tawba/routes/app_pages.dart';
import 'package:tawba/routes/app_routes.dart';
import 'package:tawba/styles/colors.dart';

void main() {
  runApp(const Tawba());
}

class Tawba extends StatelessWidget {
  const Tawba({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.SPLASH,
      getPages: AppPages.pages,
      title: 'Tawba',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.kScaffoldBackColor,
        useMaterial3: true,
      ),
    );
  }
}
