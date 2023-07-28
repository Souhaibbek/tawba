import 'package:flutter/material.dart';
import 'package:tawba/functions/linear_gradient.dart';
import 'package:tawba/styles/colors.dart';
import 'package:tawba/styles/styles.dart';

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
    this.onTap,
    required this.progressValue,
  });
  final String zekr;
  final String desc;
  final String ref;
  final int pos;
  final int length;
  final String count;
  final int countNumber;
  final void Function()? onTap;
  final double progressValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            gradient: zekrContainerLinearGradient(),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: SingleChildScrollView(
                            child: Text(
                              zekr,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.zekrTextStyle,
                            ),
                          ),
                        ),
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
                const SizedBox(
                  height: 10.0,
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
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          '$countNumber',
                          style: AppTextStyles.descriptionTextStyle,
                        ),
                        CircularProgressIndicator(
                          value: progressValue,
                          backgroundColor: AppColors.kGreyColor,
                          color: Colors.yellow,
                          strokeWidth: 2,
                        ),
                      ],
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
      ),
    );
  }
}
