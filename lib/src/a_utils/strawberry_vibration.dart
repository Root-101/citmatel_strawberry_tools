import 'package:vibration/vibration.dart';

class StrawberryVibration {
  static Future<void> vibrate({int duration = 500}) {
    return Vibration.vibrate(
      duration: duration,
    );
  }
}
