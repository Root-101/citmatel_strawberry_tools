import 'package:vibration/vibration.dart';

class StrawberryVibration {
  static Future<void> vibrate({int duration = 500}) {
    return Vibration.vibrate(
      duration: duration,
    );
  }

  static Future<void> vibrateWithWinPattern({int duration = 7000}) {
    return Vibration.vibrate(
      pattern: [500, 500, 500, 1000],
      intensities: [1, 255],
      duration: duration,
    );
  }
}
