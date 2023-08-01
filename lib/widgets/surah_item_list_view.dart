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
  });
  final String verse;
  final String symbol;
  final int count;
  final bool playingVerse;
  final void Function()? playVerseAudio;
  final void Function()? stopVerseAudio;
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
                        .copyWith(color: Colors.black),
                  ),
                  TextSpan(
                    text: ' $symbol ',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}