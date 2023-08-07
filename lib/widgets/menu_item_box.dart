import 'package:flutter/material.dart';
import 'package:tawba/functions/linear_gradient.dart';
import 'package:tawba/styles/colors.dart';
import 'package:tawba/styles/styles.dart';

class MenuItemBox extends StatelessWidget {
  const MenuItemBox({
    super.key,
    required this.title,
    this.onTap,
    required this.logo,
  });
  final String title;
  final void Function()? onTap;
  final String logo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 120,
              width: 140,
              decoration: BoxDecoration(
                gradient: menuBoxItemLinearGradient(),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const SizedBox(),
            ),
            SizedBox(
              height: 80,
              child: Image.asset(
                logo,
                color: AppColors.kprimarygradientColor5.withOpacity(0.4),
              ),
            ),
            SizedBox(
              height: 120,
              width: 140,
              child: Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.menuItemTitle.copyWith(
                    color: AppColors.kWhiteColor,
                    fontSize: 24,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
