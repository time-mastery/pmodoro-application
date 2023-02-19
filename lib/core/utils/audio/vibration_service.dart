import 'package:vibration/vibration.dart';

class VibrationService {
  Future<bool> checkDeviceCapabilities() async {
    bool levelOne = await Vibration.hasVibrator() ?? false;
    bool levelTwo = await Vibration.hasAmplitudeControl() ?? false;
    bool levelThree = await Vibration.hasCustomVibrationsSupport() ?? false;
    List levels = [levelOne, levelTwo, levelThree];
    return levels.contains(true);
  }

  void basicVibrationCapabilities() async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate();
    }
  }

  void amplitudeVibrationCapabilities() async {
    if (await Vibration.hasAmplitudeControl() ?? false) {
      Vibration.vibrate(amplitude: 128);
    }
  }

  void customVibrationCapabilities() async {
    if (await Vibration.hasCustomVibrationsSupport() ?? false) {
      Vibration.vibrate(duration: 1000);
    }
  }
}
