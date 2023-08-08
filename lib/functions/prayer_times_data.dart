import 'package:adhan/adhan.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'location_services.dart';

class PrayerTimesData {
  static List<Placemark> placemarks = [];
  static Future<List<String>> initPrayerTimes() async {
    final List<String> prayerData = [];

    //determineLocation
    final location = await LocationService.determineLocation();

    //get coordinatess
    final coordinates = Coordinates(
      32.9315727,
      10.450413,
    );

    //getAddress

    placemarks =
        await placemarkFromCoordinates(location.latitude!, location.longitude!);

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

    final fajr = DateFormat.jm().format(prayerTimes.fajr);
    prayerData.add(fajr);

    final sunrise = DateFormat.jm().format(prayerTimes.sunrise);
    prayerData.add(sunrise);

    final dhuhr = DateFormat.jm().format(prayerTimes.dhuhr);
    prayerData.add(dhuhr);

    final asr = DateFormat.jm().format(prayerTimes.asr);
    prayerData.add(asr);

    final maghrib = DateFormat.jm().format(prayerTimes.maghrib);
    prayerData.add(maghrib);

    final isha = DateFormat.jm().format(prayerTimes.isha);
    prayerData.add(isha);

    return prayerData;
  }
}
