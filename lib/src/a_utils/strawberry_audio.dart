import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';

class StrawberryAudio {
  final assetsAudioPlayer = AssetsAudioPlayer();

  static void playAudioCorrect(bool mute) {
    playAudio(ToolsAssets.AUDIO_CORRECT, mute);
  }

  static void playAudioWrong(bool mute) {
    playAudio(ToolsAssets.AUDIO_WRONG, mute);
  }

  static void playAudioWin(bool mute) {
    playAudio(ToolsAssets.AUDIO_WIN, mute);
  }

  static void playAudioLose(bool mute) {
    playAudio(ToolsAssets.AUDIO_LOSE, mute);
  }

  static void playAudio(String audioUrl, bool mute) {
    try {
      AssetsAudioPlayer.playAndForget(
        Audio(audioUrl),
        volume: mute ? 0 : 100,
      );
    } catch (error) {
      print('Error reproduciendo el sonido');
    }
  }
}
