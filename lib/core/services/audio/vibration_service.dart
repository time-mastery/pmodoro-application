import "package:vibration/vibration.dart";

class VibrationService {
  Future<bool> checkDeviceCapabilities() async {
    final bool levelOne = await Vibration.hasVibrator();
    final bool levelTwo = await Vibration.hasAmplitudeControl();
    final bool levelThree = await Vibration.hasCustomVibrationsSupport();
    final List levels = [levelOne, levelTwo, levelThree];
    return levels.contains(true);
  }

  void basicVibrationCapabilities() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate();
    }
  }

  void amplitudeVibrationCapabilities() async {
    if (await Vibration.hasAmplitudeControl()) {
      Vibration.vibrate(amplitude: 128);
    }
  }

  void customVibrationCapabilities() async {
    if (await Vibration.hasCustomVibrationsSupport()) {
      Vibration.vibrate(duration: 1000);
    }
  }
}
