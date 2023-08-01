import 'package:get/get.dart';
import 'package:quran/quran.dart' as quran;

class QuranController extends GetxController {
  List<String> surahTitles = [];
  List<String> surahType = [];
  List<int> surahLength = [];
  List<String> surahSymbols = [];
  List<String> verses = [];
  List<String> verseSymbols = [];
  String basmala = quran.basmala;
  RxBool pageView = false.obs;
  List<String> getSurahMenuItems() {
    var totalsurah = quran.totalSurahCount;

    for (var i = 1; i <= totalsurah; i++) {
      surahTitles.add(
        quran.getSurahNameArabic(i),
      );

      surahSymbols.add(
        quran.getVerseEndSymbol(i, arabicNumeral: true),
      );

      surahType.add(
        quran.getPlaceOfRevelation(i),
      );

      surahLength.add(
        quran.getVerseCount(i),
      );
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

  List<String> getVersesBySurahNumber(int surahNumber) {
    verses = [];
    verseSymbols = [];
    var surahLength = quran.getVerseCount(surahNumber);
    for (var i = 1; i <= surahLength; i++) {
      verses.add(
        quran.getVerse(surahNumber, i),
      );
      verseSymbols.add(
        quran.getVerseEndSymbol(i, arabicNumeral: true),
      );
    }
    update();
    return verses;
  }

  void changeView() {
    pageView.value = !pageView.value;
    update();
  }
}
