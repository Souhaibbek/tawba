import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tawba/styles/styles.dart';

class SurahPageItem extends StatelessWidget {
  const SurahPageItem({
    super.key,
    required this.verse,
    required this.symbol,
    required this.count,
  });
  final String verse;
  final String symbol;
  final int count;
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
                    const Icon(
                      Icons.play_arrow_rounded,
                      size: 30,
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
                      ),
                    ),
                  ],
                ),
                // Text(
                //   count.toString(),
                //   style: AppTextStyles.descriptionTextStyle
                //       .copyWith(color: Colors.black),
                // ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                verse + symbol,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style:
                    AppTextStyles.zekrTextStyle.copyWith(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
