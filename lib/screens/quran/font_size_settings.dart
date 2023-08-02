import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/styles/colors.dart';
import 'package:tawba/styles/styles.dart';
import 'package:tawba/widgets/global_appbar.dart';
import 'package:tawba/widgets/my_custom_slider.dart';

import 'quran_controller.dart';

class FontSizeSettings extends StatelessWidget {
  const FontSizeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: QuranController(),
      initState: (state) {},
      builder: (controller) {
        return Scaffold(
          appBar: GlobalAppBar(
            title: 'اعدادات الخط',
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: GestureDetector(
                  child: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'خط المصحف المقسم:',
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: AppTextStyles.zekrTextStyle
                              .copyWith(color: AppColors.kBlackColor),
                        ),
                        MyCustomSlider(
                          value: controller.partSize.value,
                          onChanged: (val) {
                            controller.changeFontPartSize(val);
                          },
                        ),
                        Text(
                          'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ ',
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: AppTextStyles.versesTextStyle.copyWith(
                            color: AppColors.kBlackColor,
                            fontSize: controller.partSize.value,
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Divider(
                        height: 1,
                        color: AppColors.kGreyColor,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'خط المصحف العادي:',
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: AppTextStyles.zekrTextStyle
                              .copyWith(color: AppColors.kBlackColor),
                        ),
                        MyCustomSlider(
                          value: controller.fullSize.value,
                          onChanged: (val) {
                            controller.changeFontFullSize(val);
                          },
                        ),
                        Text(
                          'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ ',
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: AppTextStyles.versesTextStyle.copyWith(
                            color: AppColors.kBlackColor,
                            fontSize: controller.fullSize.value,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                color: AppColors.kprimarygradientColor5,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    'حفظ',
                                    style: AppTextStyles.descriptionTextStyle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.defaultFontSize();
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                color: AppColors.kprimarygradientColor5,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    'الاعدادت الاصلية',
                                    style: AppTextStyles.descriptionTextStyle,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
