import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tawba/styles/styles.dart';

class SurahItemListView extends StatelessWidget {
  const SurahItemListView({
    super.key,
    required this.verse,
    required this.symbol,
    required this.count,
    this.playVerseAudio,
    this.playingVerse = false,
    this.stopVerseAudio,
    required this.tafsir,
    required this.isTafsirShowed,
    this.size = 30,
  });
  final String verse;
  final String symbol;
  final int count;
  final bool playingVerse;
  final bool isTafsirShowed;
  final double size;

  final void Function()? playVerseAudio;
  final void Function()? stopVerseAudio;
  final String tafsir;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    (!playingVerse)
                        ? GestureDetector(
                            onTap: playVerseAudio,
                            child: const Icon(
                              Icons.play_arrow_rounded,
                              size: 30,
                            ),
                          )
                        : GestureDetector(
                            onTap: stopVerseAudio,
                            child: const Icon(
                              Icons.play_arrow_rounded,
                              size: 30,
                            ),
                          ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: '$verse$symbol'))
                            .then((_) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  content: Text(
                            'تم النسخ!',
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            style: AppTextStyles.descriptionTextStyle,
                          )));
                        });
                      },
                      child: const Icon(
                        Icons.copy,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: RichText(
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                text: TextSpan(children: [
                  TextSpan(
                    text: verse,
                    style: AppTextStyles.versesTextStyle
                        .copyWith(color: Colors.black, fontSize: size),
                  ),
                  TextSpan(
                    text: ' $symbol ',
                    style: TextStyle(
                      fontSize: size - 5,
                      color: Colors.black,
                    ),
                  ),
                ]),
              ),
            ),
            if (isTafsirShowed)
              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'تفسير:',
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: AppTextStyles.zekrTextStyle
                          .copyWith(color: Colors.black38, fontSize: size - 5),
                    ),
                    Text(
                      tafsir,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: AppTextStyles.zekrTextStyle.copyWith(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: size - 5),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
