import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

import '../../functions/prayer_times_data.dart';

class PrayerController extends GetxController {
  List<String> prayerData = [];
  List<Placemark> placemarks = [];
  DateTime? nextPrayerDateTime;
  String nxtPrayerTimeLeft = '';
  RxBool loading = false.obs;
  Future<List<String>> getPrayerData() async {
    loading.value = true;
    try {
      if (prayerData.isEmpty) {
        prayerData = await PrayerTimesData.getPrayerTimesList();
        placemarks = await getAddress();
        nextPrayerDateTime = getNextPrayer();
        changeDurationFormat(nextPrayerDateTime!);
        loading.value = false;
        update();
        return prayerData;
      }
    } catch (e) {
      log('e.toString()');
      log(e.toString());
    }
    loading.value = false;
    update();
    return prayerData;
  }

  Future<List<Placemark>> getAddress() async {
    placemarks = [];
    placemarks = PrayerTimesData.placemarks;
    update();
    return placemarks;
  }

  DateTime getNextPrayer() {
    nextPrayerDateTime = PrayerTimesData.nxtPray;
    log('mmm+$nextPrayerDateTime');

    update();
    return nextPrayerDateTime!;
  }

  void changeDurationFormat(DateTime dateTime) {
    Duration duration = dateTime.difference(DateTime.now());
    String hours = duration.inHours.toString().padLeft(0, '2');
    String minutes = duration.inMinutes.toString().padLeft(2, '0');

    nxtPrayerTimeLeft = '$hours ساعة و  $minutes دقيقة';
    update();
  }
}
