import 'dart:developer';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran/quran.dart' as quran;

class QuranController extends GetxController {
  List<String> surahTitles = [];
  List<String> surahType = [];
  List<int> surahLength = [];
  List<String> surahSymbols = [];
  List<String> verses = [];
  List<String> verseSymbols = [];
  List<String> verseAudios = [];
  String basmala = quran.basmala;
  final player = AudioPlayer();
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
    verseAudios = [];
    var surahLength = quran.getVerseCount(surahNumber);
    for (var i = 1; i <= surahLength; i++) {
      verses.add(
        quran.getVerse(surahNumber, i),
      );
      verseSymbols.add(
        quran.getVerseEndSymbol(i, arabicNumeral: true),
      );
      verseAudios.add(
        quran.getAudioURLByVerse(
          surahNumber,
          i,
        ),
      );
    }
    log(verseAudios[10]);
    update();
    return verses;
  }

  void changeView() {
    pageView.value = !pageView.value;
    update();
  }

  RxBool clicked = false.obs;
  void playAudio(int index) async {
    player.setUrl(verseAudios[index]);
    clicked.value = true;
    await player.play();
    update();
  }

  void stopAudio() async {
    clicked.value = false;
    await player.stop();
    update();
  }
}
