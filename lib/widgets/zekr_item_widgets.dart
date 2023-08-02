import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/functions/linear_gradient.dart';
import 'package:tawba/styles/colors.dart';
import 'package:tawba/styles/styles.dart';
import 'package:flutter/services.dart';

import '../functions/icon_Button.dart';

class ZekrItemWidget extends StatelessWidget {
  const ZekrItemWidget({
    super.key,
    required this.zekr,
    this.desc = '',
    this.ref = '',
    required this.pos,
    required this.length,
    required this.count,
    required this.countNumber,
    this.onTap,
    required this.progressValue,
    this.addSize,
    this.lowSize,
    this.restart,
    this.size = 0.0,
    this.min = false,
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
  final double size;
  final bool min;
  final void Function()? addSize;
  final void Function()? lowSize;
  final void Function()? restart;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              gradient: zekrContainerLinearGradient(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    iconButton(
                      icon: Icons.copy,
                      onTap: () {
                        Clipboard.setData(ClipboardData(
                                text: '$zekr \n \n $desc\n$ref\n$count'))
                            .then((_) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  content: Text(
                            'تم النسخ!',
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            style: AppTextStyles.descriptionTextStyle,
                          )));
                        });
                      },
                    ),
                    iconButton(
                      icon: Icons.add,
                      onTap: addSize,
                    ),
                    iconButton(
                      icon: Icons.remove,
                      onTap: lowSize,
                    ),
                  ],
                ),
                Row(
                  children: [
                    iconButton(
                      icon: Icons.refresh,
                      onTap: restart,
                    ),
                    iconButton(
                      icon: Icons.arrow_forward_ios,
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  gradient: zekrContainerLinearGradient(),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
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
                                  child: RichText(
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: zekr,
                                      style:
                                          AppTextStyles.zekrTextStyle.copyWith(
                                        fontSize: 24 + size,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (!min)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height: 1,
                                  color: AppColors.kGreyColor,
                                ),
                              ),
                            if (!min)
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    if (desc != '')
                                      Text(
                                        desc,
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.right,
                                        style: AppTextStyles
                                            .descriptionTextStyle
                                            .copyWith(
                                          fontSize: 15 + size,
                                        ),
                                      ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      ref,
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.referenceTextStyle
                                          .copyWith(
                                        fontSize: 12 + size,
                                      ),
                                    ),
                                  ],
                                ),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
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
          ),
        ),
      ],
    );
  }
}
