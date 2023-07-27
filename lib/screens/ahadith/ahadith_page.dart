import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tawba/widgets/global_appbar.dart';
import 'ahadith_controller.dart';

class AhadithPage extends GetView<AhadithController> {
  const AhadithPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GlobalAppBar(
        title: 'احاديث نبوية',
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
