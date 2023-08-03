import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/routes/app_routes.dart';
import 'package:tawba/screens/quran/quran_controller.dart';

import 'package:tawba/widgets/global_appbar.dart';
import 'package:tawba/widgets/search_bar.dart';
import 'package:tawba/widgets/surahs_list_view.dart';

class QuranPage extends GetView<QuranController> {
  const QuranPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QuranController());
    return GetBuilder(
      init: QuranController(),
      initState: (state) {
        controller.getSurahMenuItems();
      },
      builder: (controller) {
        return Scaffold(
          appBar: GlobalAppBar(
            title: 'القرآن الكريم',
            leading: GestureDetector(
              child: const Icon(
                Icons.format_size_sharp,
              ),
              onTap: () {
                Get.toNamed(AppRoutes.FONTSIZESETTINGS);
              },
            ),
          ),
          body: Column(
            children: [
              SearchBarWidgets(
                controller: controller.searchSuraController,
                hintText: 'بحث في سور القران الكريم',
                onChanged: (val) {
                  controller.getSearchedSura(val);
                },
              ),
              SurahsListView(
                controller: controller,
                searchShow: controller.searchedSura.isNotEmpty,
              ),
            ],
          ),
        );
      },
    );
  }
}
