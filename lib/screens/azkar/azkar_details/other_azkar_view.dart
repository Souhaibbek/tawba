import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/screens/azkar/azkar_controller.dart';
import 'package:tawba/widgets/global_appbar.dart';
import 'package:tawba/widgets/search_bar.dart';
import 'package:tawba/widgets/zekr_list_view_widget.dart';

class OtherAzkarView extends GetView<AzkarController> {
  const OtherAzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AzkarController());
    return Scaffold(
      appBar: const GlobalAppBar(
        title: 'بقيه الاذكار',
      ),
      body: GetBuilder(
        init: AzkarController(),
        initState: (state) {
          controller.getAzkarTitles();
        },
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SearchBarWidgets(
                controller: controller.searchController,
                onChanged: (val) {
                  controller.getSearchResult(val);
                },
                onFieldSubmitted: (val) {
                  controller.getSearchResult(val);
                },
              ),
              ZekrListView(
                  searchShow: controller.searchController.text.isNotEmpty,
                  controller: controller)
            ],
          );
        },
      ),
    );
  }
}
