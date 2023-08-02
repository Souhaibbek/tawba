import 'package:flutter/material.dart';
import 'package:tawba/styles/colors.dart';

class MyCustomSlider extends StatelessWidget {
  const MyCustomSlider({
    super.key,
    required this.value,
    this.onChanged,
    this.max = 50,
    this.min = 15,
    this.activeColor,
    this.inactiveColor,
  });

  final double value;
  final void Function(double)? onChanged;
  final double max;
  final double min;
  final Color? activeColor;
  final Color? inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Slider(
        value: value,
        onChanged: onChanged,
        max: max,
        min: min,
        activeColor: activeColor ?? AppColors.kprimarygradientColor5,
        inactiveColor: inactiveColor ?? AppColors.kGradiantColor1,
      ),
    );
  }
}
