import 'package:assets_audio_player/assets_audio_player.dart';

class StrawberryAudio {
  static const String AUDIO_CORRECT = "packages/citmatel_strawberry_tools/assets/audios/keyboard_correct.wav";
  static const String AUDIO_WRONG = "packages/citmatel_strawberry_tools/assets/audios/keyboard_error.mp3";

  final assetsAudioPlayer = AssetsAudioPlayer();

  static void playAudioCorrect() {
    playAudio(AUDIO_CORRECT);
  }

  static void playAudioWrong() {
    playAudio(AUDIO_WRONG);
  }

  static void playAudio(String audioUrl) {
    AssetsAudioPlayer.playAndForget(
      Audio(audioUrl),
      volume: 100,
    );
  }
}
