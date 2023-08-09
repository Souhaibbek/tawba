import 'package:flutter/material.dart';
import 'package:tawba/screens/prayer/prayer_controller.dart';
import 'package:tawba/styles/colors.dart';
import 'package:tawba/styles/styles.dart';
import 'package:tawba/widgets/prayer_time_item.dart';

class PrayerSuccessWidget extends StatelessWidget {
  const PrayerSuccessWidget({
    super.key,
    required this.controller,
  });
  final PrayerController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        'الصلاة القادمه:',
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: AppTextStyles.zekrTextStyle,
                      ),
                      Text(
                        controller.nxtPrayerTimeLeft.value,
                        textDirection: TextDirection.rtl,
                        style: AppTextStyles.zekrTextStyle
                            .copyWith(color: AppColors.kYellowColor),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'المدينة:',
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: AppTextStyles.zekrTextStyle,
                      ),
                      Text(
                        (controller.placemarks[1].administrativeArea != null &&
                                controller.placemarks[1].administrativeArea !=
                                    '')
                            ? '${controller.placemarks[1].administrativeArea}'
                            : '${controller.placemarks[0].administrativeArea}',
                        style: AppTextStyles.zekrTextStyle
                            .copyWith(color: AppColors.kYellowColor),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
    );
  }
}
