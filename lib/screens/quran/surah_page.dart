import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/screens/quran/quran_controller.dart';
import 'package:tawba/styles/assets.dart';
import 'package:tawba/styles/colors.dart';
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
            title: 'سورة ${controller.surahTitles[surahIndex - 1]}',
            leading: GestureDetector(
              child: const Icon(
                Icons.swap_horiz_outlined,
              ),
              onTap: () {
                controller.changeView();
              },
            ),
            actions: [
              (!controller.pageView.value)
                  ? Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        child: const Icon(
                          Icons.travel_explore,
                        ),
                        onTap: () {
                          controller.changeTafsirState();
                        },
                      ),
                    )
                  : Container(),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 20),
                  //   child: Divider(
                  //     height: 1,
                  //     color: Colors.grey,
                  //   ),
                  // ),
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
                              tafsir: controller.tafsirList[index].text,
                              isTafsirShowed: controller.showTafsir.value,
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
