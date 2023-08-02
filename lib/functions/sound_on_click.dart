import 'package:just_audio/just_audio.dart';
import 'package:tawba/styles/assets.dart';

void soundOnClick() async {
  AudioPlayer audioPlayer = AudioPlayer();
  audioPlayer.setAsset(Assets.tapEffect);
  await audioPlayer.play();
}
