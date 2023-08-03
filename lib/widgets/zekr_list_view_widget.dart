import 'package:flutter/material.dart';
import 'package:tawba/screens/azkar/azkar_controller.dart';

import 'azkar_title_menu_item.dart';

class ZekrListView extends StatelessWidget {
  const ZekrListView({
    super.key,
    required this.searchShow,
    required this.controller,
  });

  final bool searchShow;
  final AzkarController controller;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: searchShow
            ? controller.searchedList.length
            : controller.azkarTitles.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              controller.onZekrItemPress(
                index,
                searchShow ? controller.searchedList : controller.azkarTitles,
              );
            },
            child: AzkarTitleMenuItem(
              title: searchShow
                  ? controller.searchedList[index]
                  : controller.azkarTitles[index],
            ),
          );
        },
      ),
    );
  }
}
