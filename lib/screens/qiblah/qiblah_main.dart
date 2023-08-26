import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:tawba/styles/colors.dart';
import 'package:tawba/widgets/global_appbar.dart';
import 'qiblah_compass.dart';

class QiblahMain extends StatelessWidget {
  QiblahMain({super.key});
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const GlobalAppBar(title: 'القبلة'),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              FutureBuilder(
                future: _deviceSupport,
                builder: (_, AsyncSnapshot<bool?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.kprimarygradientColor1,
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error.toString()}"),
                    );
                  }
                  if (snapshot.data!) {
                    return const QiblahCompass();
                  } else {
                    return Center(
                      child: Text(
                        "عذرًا، جهازك لا يدعم هذه الميزة",
                        textDirection: TextDirection.rtl,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
