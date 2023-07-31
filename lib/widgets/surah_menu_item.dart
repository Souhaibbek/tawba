import 'package:flutter/material.dart';
import 'package:tawba/styles/styles.dart';

class SurahMenuItem extends StatelessWidget {
  const SurahMenuItem({
    super.key,
    required this.title,
    required this.type,
    required this.length,
    this.color,
    required this.symbol,
  });
  final String title;
  final String type;
  final int length;
  final Color? color;
  final String symbol;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: color ?? Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              symbol,
              style: const TextStyle(fontSize: 22),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  style:
                      AppTextStyles.zekrTextStyle.copyWith(color: Colors.black),
                ),
                Text(
                  '$type - $length',
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  style: AppTextStyles.descriptionTextStyle
                      .copyWith(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
