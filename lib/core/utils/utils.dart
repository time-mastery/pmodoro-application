import "package:flutter/material.dart";
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

  static Color? getTaskDeadlineStatusColor(DateTime dateTime) {
    final now = DateTime.now();
    final diff = dateTime.difference(now);

    if (diff.isNegative) {
      return Colors.red[900];
    } else if (diff.inHours < 6) {
      return Colors.deepOrange[900];
    } else if (diff.inHours < 12) {
      return Colors.green[900];
    } else {
      return null;
    }
  }

  static String calculateRemainingTime(DateTime dateTime) {
    Duration difference = dateTime.difference(DateTime.now());
    if (difference.isNegative) {
      return "Expired"; // if the time has already passed
    }
    if (difference.inSeconds < 60) {
      return "${difference.inSeconds} seconds"; // if remaining time is less than a minute
    }
    if (difference.inMinutes < 60) {
      return "${difference.inMinutes} minutes"; // if remaining time is less than an hour
    }
    if (difference.inHours < 24) {
      return "${difference.inHours} hours"; // if remaining time is less than a day
    }
    int days = difference.inDays;
    int hours = difference.inHours.remainder(24);
    return "$days days, $hours hours"; // if remaining time is more than a day
  }

  static String monthNameOfDateTime(DateTime date) =>
      DateFormat("MMMM").format(date);

  static DateTime createOverviewItemDateTime(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  static String? formatDateToYYYYMMDD(DateTime? time) {
    if (time == null) return null;
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
