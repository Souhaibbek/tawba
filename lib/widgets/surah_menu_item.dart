import 'package:flutter/material.dart';
import 'package:tawba/styles/styles.dart';

class SurahMenuItem extends StatelessWidget {
  const SurahMenuItem({
    super.key,
    required this.title,
    required this.type,
    required this.length,
    this.color,
    this.symbol,
    this.onTap,
    this.titleStyle,
    this.descStyle,
  });
  final String title;
  final String type;
  final int length;
  final Color? color;
  final String? symbol;
  final TextStyle? titleStyle;
  final TextStyle? descStyle;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        color: color ?? Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (symbol != null)
                Text(
                  symbol!,
                  style: const TextStyle(fontSize: 22),
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "سورة $title",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: titleStyle ?? AppTextStyles.surahTitleTextStyle,
                  ),
                  (length < 11)
                      ? Text(
                          '$type - $length ايات',
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: descStyle ??
                              AppTextStyles.surahTitleTextStyle
                                  .copyWith(color: Colors.grey),
                        )
                      : Text(
                          '$type - $length اية',
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: descStyle ??
                              AppTextStyles.surahTitleTextStyle
                                  .copyWith(color: Colors.grey),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
