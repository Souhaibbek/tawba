import 'package:flutter/material.dart';
import 'package:tawba/styles/colors.dart';

LinearGradient myLinearGradient() {
  return const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color.fromARGB(255, 97, 234, 168),
      AppColors.kGradiantColor1,
      AppColors.kGradiantColor2,
    ],
  );
}
