import 'package:flutter/material.dart';
import 'package:tawba/functions/linear_gradient.dart';
import 'package:tawba/styles/styles.dart';

class MenuItemBox extends StatelessWidget {
  const MenuItemBox({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 100,
          width: 120,
          decoration: BoxDecoration(
            gradient: menuBoxItemLinearGradient(),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.menuItemTitle,
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
      ),
    );
  }
}
