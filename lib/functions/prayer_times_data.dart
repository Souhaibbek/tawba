import 'dart:developer';

import 'package:adhan/adhan.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:tawba/services/location_services.dart';

class PrayerTimesData {
  static List<Placemark> placemarks = [];
  static late DateTime nxtPray;
  static Prayer nextPrayer = Prayer.none;

  static Future<LocationData> initLocation() async {
    return await LocationService.determineLocation();
  }

  static Coordinates getCoordinates(LocationData location) {
    final coord = Coordinates(location.latitude!, location.longitude!);
    return coord;
  }

  static Future<List<Placemark>> getAddress(LocationData location) async {
    final adress = await placemarkFromCoordinates(
      location.latitude!,
      location.longitude!,
      localeIdentifier: 'ara',
    );
    return adress;
  }

  static Future<PrayerTimes> initPrayerTimes() async {
    //determineLocation
    final location = await initLocation();

    //get coordinatess
    final coordinates = getCoordinates(location);

    //getAddress
    placemarks = await getAddress(location);

    //get date
    // ignore: unused_local_variable
    final dateTime = DateTime.now();

    //setup params
    final params = CalculationMethod.muslim_world_league.getParameters();
    params.madhab = Madhab.shafi;

    //fetch prayertimes
    var prayerTimes = PrayerTimes.today(
      coordinates,
      params,
    );
    return prayerTimes;
  }

  static Future<List<Map<String, String>>> getPrayerTimesList() async {
    final prayerTimes = await initPrayerTimes();
    List<Map<String, String>> prayerData = [];
    nxtPray = getNextPrayer(prayerTimes);
    final fajr = DateFormat.jm().format(prayerTimes.fajr);
    prayerData.add({'الفجر': fajr});

    final sunrise = DateFormat.jm().format(prayerTimes.sunrise);
    prayerData.add({'الشروق': sunrise});

    final dhuhr = DateFormat.jm().format(prayerTimes.dhuhr);
    prayerData.add({'الظهر': dhuhr});

    final asr = DateFormat.jm().format(prayerTimes.asr);
    prayerData.add({'العصر': asr});

    final maghrib = DateFormat.jm().format(prayerTimes.maghrib);
    prayerData.add({'المغرب': maghrib});

    final isha = DateFormat.jm().format(prayerTimes.isha);
    prayerData.add({'العشاء': isha});
    return prayerData;
  }

  static DateTime getNextPrayer(PrayerTimes prayerTimes) {
    nextPrayer = prayerTimes.nextPrayer();
    log(nextPrayer.toString());
    DateTime nextPrayerTimeLeft = prayerTimes.timeForPrayer(nextPrayer)!;
    return nextPrayerTimeLeft;
  }
}
