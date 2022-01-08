import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:get/get.dart';

class StrawberryFunction {
  static void looseLevel() {
    StrawberryAudio.playAudioLose();
    Get.offNamed(StrawberryLevelLose.ROUTE_NAME);
  }

  static void winLevel() async {
    await Future.delayed(const Duration(seconds: 3));
    StrawberryAudio.playAudioWin();
    Get.offNamed(StrawberryLevelWin.ROUTE_NAME);
  }
}
