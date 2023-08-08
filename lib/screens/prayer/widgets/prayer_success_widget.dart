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
              Column(
                children: [
                  Text(
                    '${controller.placemarks[0].administrativeArea}/${controller.placemarks[0].country}',
                    style: AppTextStyles.zekrTextStyle,
                  ),
                  const Text(
                    ':الصلاة القادمه بعد',
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
