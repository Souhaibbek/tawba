import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

import 'widgets/prayer_times_controller.dart';

class PrayerController extends GetxController {
  List<String> prayerData = [];
  List<Placemark> placemarks = [];
  RxBool loading = false.obs;
  Future<List<String>> getPrayerData() async {
    loading.value = true;
    try {
      if (prayerData.isEmpty) {
        prayerData = await PrayerTimesData.initPrayerTimes();
        placemarks = await getAddress();
        loading.value = false;
        update();
        return prayerData;
      }
    } catch (e) {
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
}
