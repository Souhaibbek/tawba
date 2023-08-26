import 'package:flutter/material.dart';
import 'package:tawba/styles/colors.dart';
import 'package:tawba/styles/styles.dart';

class LocationErrorWidget extends StatelessWidget {
  final String? error;
  final Function? callback;

  const LocationErrorWidget({Key? key, this.error, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const errorColor = Color(0xffb00020);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(
            Icons.location_off,
            size: 150,
            color: errorColor,
          ),
          const SizedBox(height: 32),
          Text(
            'فشل في تحديد الموقع',
            textAlign: TextAlign.center,
            style: AppTextStyles.prayerStyle.copyWith(color: errorColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            error!,
            textAlign: TextAlign.center,
            style: AppTextStyles.prayerStyle.copyWith(color: errorColor),
          ),
          const SizedBox(height: 32),
          GestureDetector(
            onTap: () {
              if (callback != null) callback!();
            },
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
