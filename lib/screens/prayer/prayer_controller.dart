import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

import '../../functions/prayer_times_data.dart';

class PrayerController extends GetxController {
  List<Map<String, String>> prayerData = [];
  List<Placemark> placemarks = [];
  DateTime? nextPrayerDateTime;
  String nextPrayerName = '';
  RxString nxtPrayerTimeLeft = ''.obs;
  RxBool loading = false.obs;
  Future<List<Map<String, String>>> getPrayerData() async {
    loading.value = true;
    try {
      if (prayerData.isEmpty && placemarks.isEmpty) {
        prayerData = await PrayerTimesData.getPrayerTimesList();
        placemarks = await getAddress();
        nextPrayerDateTime = getNextPrayer();
        nextPrayerName = getNextPrayerName();
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

  String getNextPrayerName() {
    switch (PrayerTimesData.nextPrayer.toString()) {
      case 'Prayer.fajr':
        nextPrayerName = 'الفجر';
        break;
      case 'Prayer.sunrise':
        nextPrayerName = 'الشروق';
        break;
      case 'Prayer.dhuhr':
        nextPrayerName = 'الظهر';
        break;
      case 'Prayer.asr':
        nextPrayerName = 'العصر';
        break;
      case 'Prayer.maghrib':
        nextPrayerName = 'المغرب';
        break;
      case 'Prayer.isha':
        nextPrayerName = 'العشاء';
        break;
      default:
        nextPrayerName = 'الصلاة القادمه';
    }
    return nextPrayerName;
  }
}
