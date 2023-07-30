import 'package:get/get.dart';
import 'package:quran/quran.dart' as quran;

class QuranController extends GetxController {
  List<String> surahTitles = [];
  List<String> surahType = [];

  List<int> surahLength = [];
  List<String> surahSymbols = [];
  String basmala = quran.basmala;
  List<String> getSurahTitles() {
    var totalsurah = quran.totalSurahCount;
    for (var i = 1; i <= totalsurah; i++) {
      surahTitles.add(quran.getSurahNameArabic(i));
      surahSymbols.add(quran.getVerseEndSymbol(i, arabicNumeral: true));
      surahType.add(quran.getPlaceOfRevelation(i));
      surahLength.add(quran.getVerseCount(i));
    }
    for (var i = 0; i < surahType.length; i++) {
      if (surahType[i] == 'Makkah') {
        surahType[i] = 'مكيه';
        update();
      } else {
        surahType[i] = 'مدنيه';
        update();
      }
    }

    return surahTitles;
  }
}
