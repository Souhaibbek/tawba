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
    return Column(
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
          onTap: onTap,
          child: Container(
            color: AppColors.kGradiantColor1,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'تحديد الموقع',
                style: AppTextStyles.referenceTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
