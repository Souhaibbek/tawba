import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/widgets/global_appbar.dart';

import 'quran_controller.dart';

class QuranPage extends GetView<QuranController> {
  const QuranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GlobalAppBar(
        title: 'القرآن الكريم',
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
