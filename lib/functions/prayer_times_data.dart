import 'package:adhan/adhan.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:tawba/services/location_services.dart';

class PrayerTimesData {
  static List<Placemark> placemarks = [];
  static late DateTime nxtPray;
  static Future<Position> initLocation() async {
    return await LocationService.determinePosition();
  }

  static Coordinates getCoordinates(Position location) {
    final coord = Coordinates(location.latitude, location.longitude);
    return coord;
  }

  static Future<List<Placemark>> getAddress(Position location) async {
    final adress = await placemarkFromCoordinates(
      location.latitude,
      location.longitude,
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

  static Future<List<String>> getPrayerTimesList() async {
    final prayerTimes = await initPrayerTimes();
    final List<String> prayerData = [];
    nxtPray = getNextPrayer(prayerTimes);
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

  static DateTime getNextPrayer(PrayerTimes prayerTimes) {
    var nextPrayer = prayerTimes.nextPrayer();
    DateTime nextPrayerTimeLeft = prayerTimes.timeForPrayer(nextPrayer)!;
    return nextPrayerTimeLeft;
  }
}
