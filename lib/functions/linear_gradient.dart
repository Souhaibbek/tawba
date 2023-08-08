import 'package:flutter/material.dart';
import 'package:tawba/styles/colors.dart';

LinearGradient appBarLinearGradient() {
  return const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      AppColors.kprimarygradientColor1,
      AppColors.kprimarygradientColor2,
      AppColors.kprimarygradientColor3,
      AppColors.kprimarygradientColor4,
    ],
  );
}

LinearGradient menuBoxItemLinearGradient() {
  return const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color.fromARGB(255, 59, 172, 182),
      Color.fromARGB(255, 34, 121, 129),
    ],
  );
}

LinearGradient zekrContainerLinearGradient() {
  return const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      AppColors.kprimarygradientColor1,
      AppColors.kprimarygradientColor2,
    ],
  );
}

LinearGradient searchBarGradient() {
  return const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color.fromARGB(255, 255, 255, 255),
      Color.fromARGB(255, 116, 116, 116),
      Color.fromARGB(255, 199, 199, 199),
      Color.fromARGB(255, 0, 0, 0),
    ],
  );
}

LinearGradient prayerGradientItem() {
  return const LinearGradient(
    colors: [
      AppColors.kGradiantColor1,
      AppColors.kGradiantColor2,
      AppColors.kGradiantColor3
    ],
  );
}
