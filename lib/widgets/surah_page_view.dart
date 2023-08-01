import 'package:flutter/material.dart';
import 'package:tawba/styles/styles.dart';

class SurahPageView extends StatelessWidget {
  const SurahPageView({
    super.key,
    required this.verses,
    required this.symbols,
  });
  final List<String> verses;

  final List<String> symbols;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: SizedBox(
        child: Column(
          children: [
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Divider(
                height: 1,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
