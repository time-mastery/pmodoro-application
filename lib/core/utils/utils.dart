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

  static bool checkDateIsToday(DateTime date) {
    return (DateTime(date.year, date.month, date.day)
            .difference(DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day))
            .inDays ==
        0);
  }

  static int calculatePomodoroTime(int defaultDuration, int timerDuration) =>
      defaultDuration - timerDuration;

  static bool convertStringFromStorageToBool(String item) =>
      item == "1" ? true : false;
}
