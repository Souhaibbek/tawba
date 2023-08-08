import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

import '../../functions/prayer_times_data.dart';

class PrayerController extends GetxController {
  List<String> prayerData = [];
  List<Placemark> placemarks = [];
  DateTime? nextPrayerDateTime;
  RxString nxtPrayerTimeLeft = ''.obs;
  RxBool loading = false.obs;
  Future<List<String>> getPrayerData() async {
    loading.value = true;
    try {
      if (prayerData.isEmpty && placemarks.isEmpty) {
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

    update();
    return nextPrayerDateTime!;
  }

  String changeDurationFormat(DateTime dateTime) {
    Duration duration = dateTime.difference(DateTime.now());
    String hours = duration.inHours.toString().padLeft(0, '2');
    String minutes =
        duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    nxtPrayerTimeLeft.value = '$hours:$minutes:$seconds';
    update();
    return nxtPrayerTimeLeft.value;
  }
}
