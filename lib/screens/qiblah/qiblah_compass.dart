import 'dart:async';
import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:tawba/styles/assets.dart';
import 'package:tawba/styles/colors.dart';

import 'location_error_widget.dart';

class QiblahCompass extends StatefulWidget {
  const QiblahCompass({super.key});

  @override
  QiblahCompassState createState() => QiblahCompassState();
}

class QiblahCompassState extends State<QiblahCompass> {
  final _locationStreamController =
      StreamController<LocationStatus>.broadcast();

  get stream => _locationStreamController.stream;

  Future<void> _checkLocationStatus() async {
    // before running the app please enable your location

    final locationStatus = await FlutterQiblah.checkLocationStatus();
    final location = Location();
    final locationEnabled = await location.serviceEnabled();
    if (!locationEnabled) {
      await location.requestService();
    }
    if (locationStatus.enabled &&
        locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final s = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(s);
    } else {
      _locationStreamController.sink.add(locationStatus);
    }
  }

  @override
  void initState() {
    _checkLocationStatus();
    super.initState();
  }

  @override
  void dispose() {
    _locationStreamController.close();
    FlutterQiblah().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: stream,
          builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.kprimarygradientColor1,
                ),
              );
            }
            if (snapshot.data!.enabled == true) {
              switch (snapshot.data!.status) {
                case LocationPermission.always:
                case LocationPermission.whileInUse:
                  return const QiblahCompassWidget();

                case LocationPermission.denied:
                  return LocationErrorWidget(
                    error: 'الرجاء السماح للتطبيق بتحديد الموقع واعادة الاتصال',
                    callback: _checkLocationStatus,
                  );
                case LocationPermission.deniedForever:
                  return LocationErrorWidget(
                    error: 'الرجاء السماح للتطبيق بتحديد الموقع واعادة الاتصال',
                    callback: _checkLocationStatus,
                  );
                default:
                  return Container();
              }
            } else {
              return LocationErrorWidget(
                error: 'الرجاء السماح للتطبيق بتحديد الموقع واعادة الاتصال',
                callback: _checkLocationStatus,
              );
            }
          },
        ),
      ),
    );
  }
}

class QiblahCompassWidget extends StatefulWidget {
  const QiblahCompassWidget({super.key});

  @override
  State<QiblahCompassWidget> createState() => _QiblahCompassWidgetState();
}

Animation<double>? animation;
AnimationController? _animationController;
double begin = 0.0;

class _QiblahCompassWidgetState extends State<QiblahCompassWidget>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));

    //
    animation = Tween(begin: 0.0, end: 0.0).animate(_animationController!);
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.kprimarygradientColor1,
            ),
          );
        }

        //
        final qiblahDirection = snapshot.data!;
        //
        animation =
            Tween(begin: begin, end: (qiblahDirection.qiblah * (pi / 180) * -1))
                .animate(_animationController!);

        //============================
        begin = (qiblahDirection.qiblah * (pi / 180) * -1);
        _animationController!.forward(from: 0);

        return Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "${qiblahDirection.direction.toInt()}°",
              style: const TextStyle(color: Colors.black, fontSize: 40),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 300,
              child: AnimatedBuilder(
                animation: animation!,
                builder: (context, child) => Transform.rotate(
                  angle: animation!.value,
                  child: Image.asset(Assets.qibla),
                ),
              ),
            ),
          ]),
        );
      },
    );
  }
}
