import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/functions/linear_gradient.dart';
import 'package:tawba/styles/colors.dart';
import 'package:tawba/styles/styles.dart';
import 'package:flutter/services.dart';

import '../functions/icon_Button.dart';

class GodNamesItemWidget extends StatelessWidget {
  const GodNamesItemWidget({
    super.key,
    required this.name,
    this.desc = '',
    this.onTap,
    this.addSize,
    this.lowSize,
    this.restart,
    this.copy,
    this.size = 0.0,
  });
  final String name;
  final String desc;

  final void Function()? onTap;

  final double size;

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
                                ClipboardData(text: '$name \n \n $desc'))
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
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              name,
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.zekrTextStyle.copyWith(
                                fontSize: 36 + size,
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
                          Column(
                            children: [
                              if (desc != '')
                                Text(
                                  desc,
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  style: AppTextStyles.descriptionTextStyle
                                      .copyWith(
                                    fontSize: 20 + size,
                                  ),
                                ),
                              const SizedBox(
                                height: 5.0,
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
          ),
        ),
      ],
    );
  }
}
