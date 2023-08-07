import 'package:flutter/material.dart';
import 'package:tawba/styles/assets.dart';
import 'package:tawba/styles/colors.dart';
import 'package:tawba/styles/styles.dart';

class PrayerTimeItem extends StatelessWidget {
  const PrayerTimeItem({
    super.key,
    required this.time,
    required this.index,
  });
  final String time;

  final int index;
  static const List<String> prayersNames = [
    'الفجر',
    'الشروق',
    'الظهر',
    'العصر',
    'المغرب',
    'العشاء',
  ];
  static const List<String> prayersIcons = [
    Assets.fajr,
    Assets.sunrise,
    Assets.dhuhr,
    Assets.asr,
    Assets.maghrib,
    Assets.isha,
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.kGradiantColor1,
              AppColors.kGradiantColor2,
              AppColors.kGradiantColor3
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                time,
                style: AppTextStyles.referenceTextStyle.copyWith(fontSize: 20),
              ),
              Row(
                children: [
                  Text(
                    prayersNames[index],
                    style: AppTextStyles.zekrTextStyle,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                      height: 30,
                      child: Image.asset(
                        prayersIcons[index],
                        color: AppColors.kYellowColor,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
