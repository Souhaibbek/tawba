import 'package:flutter/material.dart';
import 'package:tawba/functions/linear_gradient.dart';
import 'package:tawba/styles/styles.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GlobalAppBar({
    super.key,
    this.height = 100.0,
    required this.title,
  });
  final double height;
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        textDirection: TextDirection.rtl,
        style: AppTextStyles.appBarTitle,
      ),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: appBarLinearGradient(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
