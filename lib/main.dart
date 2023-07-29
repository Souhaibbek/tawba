import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tawba/routes/app_pages.dart';
import 'package:tawba/routes/app_routes.dart';
import 'package:tawba/styles/colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const Tawba());
}

class Tawba extends StatelessWidget {
  const Tawba({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.SPLASH,
      getPages: AppPages.pages,
      title: 'Tawba',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.kGradiantColor3,
        useMaterial3: true,
      ),
    );
  }
}
