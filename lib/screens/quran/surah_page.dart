import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/screens/quran/quran_controller.dart';
import 'package:tawba/styles/assets.dart';
import 'package:tawba/styles/colors.dart';
import 'package:tawba/styles/styles.dart';
import 'package:tawba/widgets/global_appbar.dart';
import 'package:tawba/widgets/surah_item_list_view.dart';
import 'package:tawba/widgets/surah_page_view.dart';

class SurahPage extends GetView<QuranController> {
  const SurahPage({super.key});

  @override
  Widget build(BuildContext context) {
    var surahIndex = Get.arguments;
    return GetBuilder(
      init: QuranController(),
      initState: (state) {},
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: GlobalAppBar(
            title: 'القرآن الكريم',
            leading: GestureDetector(
              child: const Icon(
                Icons.swap_horiz_outlined,
              ),
              onTap: () {
                controller.changeView();
              },
            ),
          ),
          body: SingleChildScrollView(
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
                            height: 20,
                          ),
                          Text(
                            'سورة ${controller.surahTitles[surahIndex - 1]}',
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style: AppTextStyles.surahTitleTextStyle.copyWith(
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
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
                  (!controller.pageView.value)
                      ? ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.verses.length,
                          separatorBuilder: (context, index) => const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                          itemBuilder: (context, index) {
                            return SurahItemListView(
                              count: index + 1,
                              verse: controller.verses[index],
                              symbol: controller.verseSymbols[index],
                              playingVerse: controller.clickedVerse.value,
                              playVerseAudio: () =>
                                  controller.playVerseAudio(index),
                              stopVerseAudio: () => controller.stopVerseAudio(),
                            );
                          },
                        )
                      : SurahPageView(
                          verses: controller.verses,
                          symbols: controller.verseSymbols,
                          playingSurah: controller.clickedSurah.value,
                          playSurahAudio: () => controller.playSurahAudio(),
                          stopSurahAudio: () => controller.stopSurahAudio(),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
