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
                        'بعد:',
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: AppTextStyles.prayerStyle,
                      ),
                      Text(
                        controller.nxtPrayerTimeLeft.value,
                        textDirection: TextDirection.rtl,
                        style: AppTextStyles.prayerStyle
                            .copyWith(color: AppColors.kYellowColor),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        controller.nextPrayerName,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: AppTextStyles.prayerStyle.copyWith(
                            color: AppColors.kYellowColor, fontSize: 35),
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
                        style: AppTextStyles.prayerStyle,
                      ),
                      Text(
                        (controller.placemarks[1].administrativeArea != null &&
                                controller.placemarks[1].administrativeArea !=
                                    '')
                            ? '${controller.placemarks[1].administrativeArea}'
                            : '${controller.placemarks[0].administrativeArea}',
                        style: AppTextStyles.prayerStyle
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
                  // log(controller.prayerData.toString());
                  // log(controller.prayerData.elementAt(index).keys.toString());
                  // log(controller.prayerData.elementAt(index).values.toString());

                  return PrayerTimeItem(
                    time: controller.prayerData
                        .elementAt(index)
                        .values
                        .toString(),
                    name:
                        controller.prayerData.elementAt(index).keys.toString(),
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
