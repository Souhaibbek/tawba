import 'package:get/get.dart';
import 'package:tawba/functions/sound_on_click.dart';

class TasbihController extends GetxController {
  RxDouble angle = 0.0.obs;
  RxInt numbetoftasbeha = 0.obs;

  void tasbih() {
    angle.value++;
    numbetoftasbeha.value++;
  }

  void reset() {
    soundOnClick();
    angle.value = 0;
    numbetoftasbeha.value = 0;
  }
}
