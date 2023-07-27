import 'package:flutter/material.dart';
import 'package:tawba/styles/colors.dart';
import 'package:tawba/styles/styles.dart';

import '../functions/linear_gradient.dart';

class ZekrItemWidget extends StatelessWidget {
  const ZekrItemWidget({
    super.key,
    required this.zekr,
    required this.desc,
    required this.ref,
    required this.pos,
    required this.length,
    required this.count,
    required this.countNumber,
  });
  final String zekr;
  final String desc;
  final String ref;
  final int pos;
  final int length;
  final String count;
  final int countNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: zekrContainerLinearGradient(),
          borderRadius: BorderRadius.circular(16),
        ),
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      zekr,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.zekrTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 1,
                        color: AppColors.kGreyColor,
                      ),
                    ),
                    if (desc != '')
                      Text(
                        desc,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.descriptionTextStyle,
                      ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      ref,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.referenceTextStyle,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 19),
                        child: Container(
                          color: AppColors.kGreyColor,
                          height: 1.0,
                          width: MediaQuery.of(context).size.width * 0.35,
                        ),
                      ),
                      Text(
                        "$pos/$length",
                        style: AppTextStyles.descriptionTextStyle,
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Text(
                      '$countNumber',
                      style: AppTextStyles.descriptionTextStyle,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 19),
                        child: Container(
                          color: AppColors.kGreyColor,
                          height: 1.0,
                          width: MediaQuery.of(context).size.width * 0.35,
                        ),
                      ),
                      Text(
                        count,
                        style: AppTextStyles.descriptionTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
