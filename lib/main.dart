import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tawba/routes/app_pages.dart';
import 'package:tawba/routes/app_routes.dart';
import 'package:tawba/utils/global_variables.dart';
import 'functions/notification.dart';
import 'services/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationHelper notificationHelper = NotificationHelper();
  await notificationHelper.initialize(); // Initialize notification plugin
  notificationHelper.scheduleNextNotification();

  await SharedPrefHelper.init();
  initValue = await SharedPrefHelper.getInt(key: 'index') ?? 0;

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
        scaffoldBackgroundColor: Colors.white.withOpacity(0.9),
        useMaterial3: true,
      ),
    );
  }
}
