import 'package:flutter/material.dart';
import 'package:tawba/functions/linear_gradient.dart';
import 'package:tawba/styles/styles.dart';

class AzkarTitleMenuItem extends StatelessWidget {
  const AzkarTitleMenuItem({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: zekrContainerLinearGradient(),
        ),
        child: RichText(
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          text: TextSpan(
            text: title,
            style: AppTextStyles.zekrTextStyle.copyWith(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
