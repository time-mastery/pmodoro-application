import 'package:uuid/uuid.dart';

class Utils {
  static String formatSecToMinSec({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }

  static String createUniqueId() {
    Uuid uuid = const Uuid();
    return uuid.v4();
  }
}
