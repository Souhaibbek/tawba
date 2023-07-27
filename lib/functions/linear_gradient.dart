import 'package:flutter/material.dart';
import 'package:tawba/styles/colors.dart';

LinearGradient appBarLinearGradient() {
  return const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color.fromARGB(255, 111, 183, 159),
      AppColors.kGradiantColor1,
      Color.fromARGB(255, 34, 75, 61),
      Color.fromARGB(255, 2, 80, 54),
      AppColors.kGradiantColor2,
      AppColors.kGradiantColor2,
    ],
  );
}

LinearGradient myLinearGradient() {
  return const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      AppColors.kGradiantColor1,
      AppColors.kGradiantColor2,
    ],
  );
}
