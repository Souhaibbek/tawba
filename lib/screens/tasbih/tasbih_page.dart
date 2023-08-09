import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/functions/linear_gradient.dart';
import 'package:tawba/screens/tasbih/tasbih_controller.dart';
import 'package:tawba/styles/assets.dart';
import 'package:tawba/styles/colors.dart';
import 'package:tawba/styles/styles.dart';
import 'package:tawba/widgets/global_appbar.dart';

class TasbihPage extends StatelessWidget {
  const TasbihPage({super.key});

  @override
  Widget build(BuildContext context) {
    TasbihController controller = Get.put(TasbihController());
    return Scaffold(
      appBar: const GlobalAppBar(
        title: "السبحة",
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: zekrContainerLinearGradient(),
        ),
        width: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              "اضغط على السبحة للتسبيح",
              style: AppTextStyles.zekrTextStyle,
            ),
            const Spacer(),
            Obx(
              () => Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.tasbih();
                    },
                    child: Transform.rotate(
                        angle: controller.angle.value,
                        child: Image.asset(
                          Assets.sabha,
                          width: 320,
                          color: const Color.fromARGB(255, 168, 159, 82),
                          fit: BoxFit.fill,
                        )),
                  ),
                  Column(
                    children: [
                      const Text(
                        "عدد التسبيحات",
                        style: AppTextStyles.zekrTextStyle,
                      ),
                      Text(
                        controller.numbetoftasbeha.value.toString(),
                        style: AppTextStyles.referenceTextStyle
                            .copyWith(fontSize: 40),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                controller.reset();
              },
              child: const Icon(
                Icons.refresh,
                color: AppColors.kWhiteColor,
                size: 30,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
