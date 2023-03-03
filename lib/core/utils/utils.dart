import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../exports.dart';

class Utils {
  static String getProcessTitle(BuildContext context, double value) {
    AppLocalizations localization = AppLocalizations.of(context)!;

    if (value == 0) {
      return localization.firstStageDailyGoalTitle;
    } else if (value < .39) {
      return localization.secondStageDailyGoalTitle;
    } else if (value < .69) {
      return localization.thirdStageDailyGoalTitle;
    } else {
      return localization.lastStageDailyGoalTitle;
    }
  }

  static String monthNameOfDateTime(String date) =>
      DateFormat("MMMM").format(DateTime.parse(date));

  static DateTime createOverviewItemDateTime(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  static String formatDateToYYYYMMDD(DateTime time) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(time);
    return formattedDate;
  }

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
