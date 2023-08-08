import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tawba/functions/linear_gradient.dart';
import 'package:tawba/screens/prayer/prayer_controller.dart';
import 'package:tawba/styles/styles.dart';
import 'package:tawba/widgets/global_appbar.dart';
import 'widgets/prayer_error_widgets.dart';
import 'widgets/prayer_loading.dart';
import 'widgets/prayer_success_widget.dart';

class PrayerPage extends GetView<PrayerController> {
  const PrayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PrayerController());
    return Scaffold(
      appBar: const GlobalAppBar(
        title: 'اوقات الصلاة',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
            stream: Stream.periodic(const Duration(seconds: 1)),
            builder: (context, snapshot) {
              return Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 16.0,
                    decoration: BoxDecoration(
                      gradient: prayerGradientItem(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            DateFormat('hh:mm:ss').format(DateTime.now()),
                            style: AppTextStyles.timerStyle,
                          ),
                          Text(
                            DateFormat('dd-MM-yyyy').format(DateTime.now()),
                            style:
                                AppTextStyles.timerStyle.copyWith(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GetBuilder(
                    init: PrayerController(),
                    initState: (_) {
                      controller.getPrayerData();
                    },
                    builder: (controller) {
                      if (controller.prayerData.isNotEmpty) {
                        Timer.periodic(const Duration(seconds: 1), (timer) {
                          controller.changeDurationFormat(
                              controller.nextPrayerDateTime!);
                        });
                      }
                      return Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: zekrContainerLinearGradient(),
                          ),
                          child: Center(
                            child: controller.loading.value
                                ? const LoadingPrayer()
                                : (controller.prayerData.isNotEmpty)
                                    ? PrayerSuccessWidget(
                                        controller: controller,
                                      )
                                    : PrayerErrorWidget(
                                        onTap: () => controller.getPrayerData(),
                                      ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            }),
      ),
    );
  }
}
