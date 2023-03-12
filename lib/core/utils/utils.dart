import "package:flutter/cupertino.dart";
import "package:intl/intl.dart";
import "package:uuid/uuid.dart";

import "../../exports.dart";

class Utils {
  static String getProcessTitle(BuildContext context, double value) {
    final AppLocalizations localization = AppLocalizations.of(context)!;

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
    final DateTime dateTime = DateTime.parse(date);
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  static String formatDateToYYYYMMDD(DateTime time) {
    final String formattedDate = DateFormat("yyyy-MM-dd").format(time);
    return formattedDate;
  }

  static String formatSecToMinSec({required int timeInSecond}) {
    final int sec = timeInSecond % 60;
    final int min = (timeInSecond / 60).floor();
    final String minute = min.toString().length <= 1 ? "0$min" : "$min";
    final String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute\n$second";
  }

  static String createUniqueId() {
    const Uuid uuid = Uuid();
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
