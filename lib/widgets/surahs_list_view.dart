import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../screens/quran/quran_controller.dart';
import 'surah_menu_item.dart';

class SurahsListView extends StatelessWidget {
  const SurahsListView({
    super.key,
    required this.controller,
    required this.searchShow,
  });

  final QuranController controller;
  final bool searchShow;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: searchShow
            ? controller.searchedSura.length
            : controller.surahTitles.length,
        separatorBuilder: (context, index) =>
            const Divider(height: 1, color: Colors.white38),
        itemBuilder: (context, index) {
          int searchIndex = controller.searchedSura.isNotEmpty
              ? controller.surahTitles.indexOf(controller.searchedSura[index])
              : index;
          return SurahMenuItem(
            symbol: controller.surahSymbols[searchShow ? searchIndex : index],
            title: controller.surahTitles[searchShow ? searchIndex : index],
            type: controller.surahType[searchShow ? searchIndex : index],
            length: controller.surahLength[searchShow ? searchIndex : index],
            color: ((searchShow ? searchIndex : index) % 2 != 0)
                ? Colors.white.withOpacity(0.9)
                : null,
            onTap: () {
              Get.toNamed(AppRoutes.SURAH,
                  arguments: (searchShow ? searchIndex : index) + 1);
              controller.getVersesBySurahNumber(
                  (searchShow ? searchIndex : index) + 1);
              controller.getTafsir((searchShow ? searchIndex : index) + 1);
            },
          );
        },
      ),
    );
  }
}
