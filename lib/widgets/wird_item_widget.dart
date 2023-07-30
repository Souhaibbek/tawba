import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/functions/linear_gradient.dart';
import 'package:tawba/styles/colors.dart';
import 'package:tawba/styles/styles.dart';
import 'package:flutter/services.dart';

import '../functions/icon_Button.dart';

class WirdItemWidget extends StatelessWidget {
  const WirdItemWidget({
    super.key,
    required this.wirdText,
    required this.count,
    required this.counter,
    required this.pos,
    required this.length,
    this.onTap,
    required this.progressValue,
    this.addSize,
    this.lowSize,
    this.restart,
    this.copy,
    this.size = 0.0,
    this.min = false,
  });
  final String wirdText;

  final int pos;
  final int length;
  final String count;
  final int counter;
  final void Function()? onTap;
  final double progressValue;
  final double size;
  final bool min;
  final void Function()? addSize;
  final void Function()? lowSize;
  final void Function()? restart;
  final void Function()? copy;
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
                        Clipboard.setData(
                                ClipboardData(text: '$wirdText\n$count'))
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
                      icon: Icons.arrow_forward,
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
                                      text: wirdText,
                                      style:
                                          AppTextStyles.zekrTextStyle.copyWith(
                                        fontSize: 24 + size,
                                      ),
                                    ),
                                  ),
                                ),
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
                                '$counter',
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
