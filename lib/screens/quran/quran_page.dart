import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/screens/quran/quran_controller.dart';

import 'package:tawba/widgets/global_appbar.dart';
import 'package:tawba/widgets/surah_menu_item.dart';

class QuranPage extends GetView<QuranController> {
  const QuranPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QuranController());
    return Scaffold(
      appBar: const GlobalAppBar(
        title: 'القرآن الكريم',
      ),
      body: GetBuilder(
        init: QuranController(),
        initState: (state) {
          controller.getSurahTitles();
        },
        builder: (controller) {
          return SizedBox(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.surahTitles.length,
              itemBuilder: (context, index) {
                return SurahMenuItem(
                  symbol: controller.surahSymbols[index],
                  title: controller.surahTitles[index],
                  color:
                      (index % 2 != 0) ? Colors.white.withOpacity(0.9) : null,
                  type: controller.surahType[index],
                  length: controller.surahLength[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
