import 'package:flutter/material.dart';
import 'package:tawba/widgets/global_appbar.dart';

class GodNamesPage extends StatelessWidget {
  const GodNamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GlobalAppBar(
        title: 'اسماء الله الحسنه',
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
