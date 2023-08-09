import 'package:adhan/adhan.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import '../services/location_services.dart';

class PrayerTimesData {
  static List<Placemark> placemarks = [];
  static late DateTime nxtPray;
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
