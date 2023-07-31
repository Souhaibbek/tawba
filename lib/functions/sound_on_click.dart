import 'package:flutter/services.dart';

void soundOnClick() {
  SystemSound.play(
    SystemSoundType.click,
  );
}
