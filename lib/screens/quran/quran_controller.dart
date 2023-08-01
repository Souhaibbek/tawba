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
  String surahAudio = '';
  String basmala = quran.basmala;
  final versePlayer = AudioPlayer();
  final surahPlayer = AudioPlayer();
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
    surahAudio = '';
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
    surahAudio = quran.getAudioURLBySurah(surahNumber);
    log(surahAudio);
    update();
    return verses;
  }

  void changeView() {
    pageView.value = !pageView.value;
    update();
  }

  RxBool clickedVerse = false.obs;
  void playVerseAudio(int index) async {
    stopSurahAudio();
    versePlayer.setUrl(verseAudios[index]);
    clickedVerse.value = true;
    await versePlayer.play();
    update();
  }

  void stopVerseAudio() async {
    clickedVerse.value = false;
    await versePlayer.stop();
    update();
  }

  RxBool clickedSurah = false.obs;
  void playSurahAudio() async {
    versePlayer.stop();
    surahPlayer.setUrl(surahAudio);
    clickedSurah.value = true;
    await surahPlayer.play();
    update();
  }

  void stopSurahAudio() async {
    stopVerseAudio();
    clickedSurah.value = false;
    await surahPlayer.stop();
    update();
  }
}
