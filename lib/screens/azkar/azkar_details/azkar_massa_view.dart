import 'package:flutter/material.dart';
import 'package:tawba/widgets/global_appbar.dart';

class AzkarMassaView extends StatelessWidget {
  const AzkarMassaView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GlobalAppBar(
        title: 'اذكار المساء',
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(),
      ),
    );
  }
}
