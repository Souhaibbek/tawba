import 'package:flutter/material.dart';
import 'package:tawba/widgets/global_appbar.dart';

class OtherAzkarView extends StatelessWidget {
  const OtherAzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GlobalAppBar(
        title: 'بقيه الاذكار',
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(),
      ),
    );
  }
}
