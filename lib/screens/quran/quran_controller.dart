import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran/quran.dart' as quran;
import 'package:tawba/models/tafsirmodel.dart';
import 'package:tawba/utils/jsons/jsons/tafsir.dart';

class QuranController extends GetxController {
  String basmala = quran.basmala;
  RxDouble fullSize = 25.0.obs;
  RxDouble partSize = 25.0.obs;
  RxBool pageView = false.obs;
  TextEditingController searchSuraController = TextEditingController();
  //surahs
  List<String> surahTitles = [];
  List<String> surahType = [];
  List<int> surahLength = [];
  List<String> surahSymbols = [];

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

//verses
  List<String> verses = [];
  List<String> verseSymbols = [];
  List<String> verseAudios = [];
  String surahAudio = '';
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
    update();
    return verses;
  }

  void changeView() {
    pageView.value = !pageView.value;
    update();
  }

//audio
  final versePlayer = AudioPlayer();
  final surahPlayer = AudioPlayer();
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

  //tafsiir
  RxBool showTafsir = false.obs;
  void changeTafsirState() {
    showTafsir.value = !showTafsir.value;
    update();
  }

  List<TafsirModel> tafsirList = [];
  List<TafsirModel> getTafsir(int surahNumber) {
    tafsirList = [];
    for (var item in tafsir) {
      if (item['sura'] == surahNumber) {
        tafsirList.add(TafsirModel.fromJson(item));
      }
    }

    update();
    return tafsirList;
  }

  void changeFontFullSize(double val) {
    fullSize.value = val;
    update();
  }

  void changeFontPartSize(double val) {
    partSize.value = val;
    update();
  }

  void defaultFontSize() {
    partSize.value = 25.0;
    fullSize.value = 25.0;
    update();
  }

//searchsura
  List<String> searchedSura = [];
  List<String> getSearchedSura(String searchSuraText) {
    searchedSura = [];
    for (var i in surahTitles) {
      if (i.contains(searchSuraText)) {
        searchedSura.add(i);
      }
    }
    update();
    return searchedSura;
  }
}
