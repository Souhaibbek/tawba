import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/screens/quran/quran_controller.dart';
import 'package:tawba/styles/assets.dart';
import 'package:tawba/styles/colors.dart';
import 'package:tawba/styles/styles.dart';
import 'package:tawba/widgets/global_appbar.dart';
import 'package:tawba/widgets/surah_page_item.dart';

class SurahPage extends GetView<QuranController> {
  const SurahPage({super.key});

  @override
  Widget build(BuildContext context) {
    var surahIndex = Get.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const GlobalAppBar(
        title: 'القرآن الكريم',
      ),
      body: GetBuilder(
        init: QuranController(),
        initState: (state) {},
        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Image.asset(
                            Assets.cover,
                            color: AppColors.kprimarygradientColor5,
                          )),
                      Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'سورة ${controller.surahTitles[surahIndex - 1]}',
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style: AppTextStyles.zekrTextStyle.copyWith(
                              color: AppColors.kprimarygradientColor5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (surahIndex != 1 && surahIndex != 9)
                    Center(
                      child: SizedBox(
                        height: 40,
                        child: Image.asset(
                          Assets.basmalla,
                          color: AppColors.kprimarygradientColor5,
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.verses.length,
                    separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                    itemBuilder: (context, index) {
                      return SurahPageItem(
                        count: index + 1,
                        verse: controller.verses[index],
                        symbol: controller.verseSymbols[index],
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
