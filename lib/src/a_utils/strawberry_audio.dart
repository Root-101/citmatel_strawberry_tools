import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';

class StrawberryAudio {
  final assetsAudioPlayer = AssetsAudioPlayer();

  static void playAudioCorrect() {
    playAudio(ToolsAssets.AUDIO_CORRECT);
  }

  static void playAudioWrong() {
    playAudio(ToolsAssets.AUDIO_WRONG);
  }

  static void playAudioWin() {
    playAudio(ToolsAssets.AUDIO_WIN);
  }

  static void playAudioLose() {
    playAudio(ToolsAssets.AUDIO_LOSE);
  }

  static void playAudio(String audioUrl) {
    AssetsAudioPlayer.playAndForget(
      Audio(audioUrl),
      volume: 100,
    );
  }
}
