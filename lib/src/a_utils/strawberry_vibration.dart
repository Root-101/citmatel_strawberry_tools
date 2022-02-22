import 'package:vibration/vibration.dart';

class StrawberryVibration {
  static Future<void> vibrate({int duration = 500}) async {
    //chequea si puede vibrar
    //en dispositivos que no lo soporten, o el emulador, lanzan excepcion
    if ((await Vibration.hasVibrator() ?? false) &&
        (await Vibration.hasCustomVibrationsSupport() ?? false)) {
      return Vibration.vibrate(
        duration: duration,
      );
    }
  }

  static Future<void> vibrateWithWinPattern({int duration = 7000}) async {
    if ((await Vibration.hasVibrator() ?? false) &&
        (await Vibration.hasCustomVibrationsSupport() ?? false)) {
      return Vibration.vibrate(
        pattern: [500, 500, 500, 1000],
        intensities: [1, 255, 1, 255],
        duration: duration,
      );
    }
  }
}
