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
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.kGradiantColor1,
                    AppColors.kGradiantColor2,
                    AppColors.kGradiantColor3
                  ],
                ),
              ),
              child: StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) => Center(
                  child: Column(
                    children: [
                      Text(
                        DateFormat('hh:mm:ss').format(DateTime.now()),
                        style: AppTextStyles.timerStyle,
                      ),
                      Text(
                        DateFormat('dd-MM-yyyy').format(DateTime.now()),
                        style: AppTextStyles.referenceTextStyle
                            .copyWith(fontSize: 12),
                      ),
                    ],
                  ),
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
                          : (controller.prayerData.isNotEmpty)
                              ? Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                            itemCount:
                                                controller.prayerData.length,
                                            itemBuilder: (context, index) {
                                              return PrayerTimeItem(
                                                time: controller
                                                    .prayerData[index],
                                                index: index,
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'فشل في تحديد الموقع',
                                      style: AppTextStyles.zekrTextStyle,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'الرجاء السماح للتطبيق بتحديد الموقع واعادة الاتصال',
                                      style: AppTextStyles.referenceTextStyle,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        color: AppColors.kGradiantColor1,
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'تحديد الموقع',
                                            style: AppTextStyles
                                                .referenceTextStyle,
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        controller.getPrayerData();
                                      },
                                    ),
                                  ],
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
