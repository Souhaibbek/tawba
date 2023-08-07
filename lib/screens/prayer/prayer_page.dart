import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tawba/functions/linear_gradient.dart';
import 'package:tawba/screens/prayer/prayer_controller.dart';
import 'package:tawba/styles/colors.dart';
import 'package:tawba/styles/styles.dart';
import 'package:tawba/widgets/global_appbar.dart';
import 'package:tawba/widgets/prayer_time_item.dart';

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
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.kGradiantColor1,
                    AppColors.kGradiantColor2,
                    AppColors.kGradiantColor3
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  DateFormat('EE  dd/MM/yyyy').format(DateTime.now()),
                  style:
                      AppTextStyles.referenceTextStyle.copyWith(fontSize: 20),
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
                return Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: zekrContainerLinearGradient(),
                    ),
                    child: Center(
                      child: controller.loading.value
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircularProgressIndicator(
                                  color: AppColors.kWhiteColor,
                                ),
                                Text(
                                  'انتظار',
                                  style:
                                      AppTextStyles.referenceTextStyle.copyWith(
                                    fontSize: 20,
                                    color: AppColors.kWhiteColor,
                                  ),
                                )
                              ],
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${controller.placemarks[0].administrativeArea}/${controller.placemarks[0].country}',
                                        style: AppTextStyles.zekrTextStyle,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: controller.prayerData.length,
                                        itemBuilder: (context, index) {
                                          return PrayerTimeItem(
                                            time: controller.prayerData[index],
                                            index: index,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
