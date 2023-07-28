import 'package:flutter/material.dart';

Padding iconButton({Function()? onTap, IconData? icon}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.center,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    ),
  );
}
