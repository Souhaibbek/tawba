import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/functions/linear_gradient.dart';
import 'package:tawba/screens/splash/splash_controller.dart';
import 'package:tawba/styles/assets.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      initState: (_) {},
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
            gradient: menuBoxItemLinearGradient(),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Hero(
                tag: "logo",
                child: Image.asset(Assets.logo),
              ),
            ),
          ),
        );
      },
    );
  }
}
