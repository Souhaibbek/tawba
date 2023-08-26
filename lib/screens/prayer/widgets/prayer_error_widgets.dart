import 'package:flutter/material.dart';
import 'package:tawba/styles/colors.dart';
import 'package:tawba/styles/styles.dart';

class PrayerErrorWidget extends StatelessWidget {
  const PrayerErrorWidget({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'فشل في تحديد الموقع',
            textAlign: TextAlign.center,
            style: AppTextStyles.prayerStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'الرجاء السماح للتطبيق بتحديد الموقع واعادة الاتصال',
            textAlign: TextAlign.center,
            style: AppTextStyles.prayerStyle
                .copyWith(color: AppColors.kYellowColor),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              color: AppColors.kGradiantColor1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'تحديد الموقع',
                  style: AppTextStyles.prayerStyle
                      .copyWith(color: AppColors.kYellowColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
