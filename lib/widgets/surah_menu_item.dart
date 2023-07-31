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
    this.onTap,
  });
  final String title;
  final String type;
  final int length;
  final Color? color;
  final String symbol;
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
              Text(
                symbol,
                style: const TextStyle(fontSize: 22),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: AppTextStyles.zekrTextStyle
                        .copyWith(color: Colors.black),
                  ),
                  (length < 11)
                      ? Text(
                          '$type - $length ايات',
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: AppTextStyles.descriptionTextStyle
                              .copyWith(color: Colors.grey),
                        )
                      : Text(
                          '$type - $length اية',
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
      ),
    );
  }
}
