import 'package:flutter/material.dart';
import 'package:tawba/styles/colors.dart';
import 'package:tawba/styles/styles.dart';

class LoadingPrayer extends StatelessWidget {
  const LoadingPrayer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          color: AppColors.kWhiteColor,
        ),
        Text(
          'انتظار',
          style: AppTextStyles.prayerStyle,
        )
      ],
    );
  }
}
