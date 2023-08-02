import 'package:flutter/material.dart';
import 'package:tawba/styles/styles.dart';

class SurahPageView extends StatelessWidget {
  const SurahPageView({
    super.key,
    required this.verses,
    required this.symbols,
    this.playingSurah = false,
    this.playSurahAudio,
    this.stopSurahAudio,
  });
  final List<String> verses;
  final List<String> symbols;
  final bool playingSurah;
  final void Function()? playSurahAudio;
  final void Function()? stopSurahAudio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: SizedBox(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (!playingSurah)
                      ? GestureDetector(
                          onTap: playSurahAudio,
                          child: const Icon(
                            Icons.play_arrow_rounded,
                            size: 30,
                          ),
                        )
                      : GestureDetector(
                          onTap: stopSurahAudio,
                          child: const Icon(
                            Icons.stop,
                            size: 30,
                          ),
                        ),
                ],
              ),
            ),
            RichText(
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              text: TextSpan(
                children: verses.map((data) {
                  return TextSpan(
                    children: [
                      TextSpan(
                        text: ' $data ',
                        style: AppTextStyles.versesTextStyle,
                      ),
                      TextSpan(
                        text: symbols[verses.indexOf(data)],
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
