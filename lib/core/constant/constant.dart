import 'package:flutter/material.dart';
import 'package:pomodore/features/home/presentation/pages/home_page.dart';
import 'package:pomodore/features/settings/presentation/pages/settings_page.dart';
import 'package:pomodore/features/tasks/presentation/pages/tasks_page.dart';
import 'package:pomodore/features/timer/presentation/pages/timer_page.dart';

class AppConstant {
  /// dimens
  static const radius = 10;

  // strings
  static const appName = "Pomodore";

  // Hero tags
  static const splashIconHeroTag = "__splash-appbar__";

  /// [HomePage]
  static const homeTab = "Home";
  static const tasksTab = "Tasks";
  static const timerTab = "Timer";
  static const profileTab = "Profile";
  static const settingTab = "Setting";

  /// [TimerPage]
  static const timerTitle = "Timer";
  static const smile = ":)";
  static const stayFocus = "Focus Time #";

  /// [SettingsPage]
  static const settingsTitle = "Settings";
  static const generalNotificationTitle = "General Notification";
  static const soundTitle = "Sound";
  static const vibrationTitle = "Vibration";
  static const appUpdatesTitle = "App Updates";
  static const newTipTitle = "New Tip Available";
  static const showAdsTitle = "Show Ads To Support";
  static const changeThemeTitle = "Change Theme";
  static const changeLanguageTitle = "Change Language";

  /// [TasksPage]
  static const tasksTitle = "Tasks";
  static const emptyTaskListTitle = "You have no task today !";
  static const emptyTaskListHint = "Click the (+) icon to add a new task !";

  /// [HomePage]
  static const homeTitle = "Pmodore";
  static const welcomeTitle = "Morning Christina 👋🏻";
  static const dailyTasksDoneTitle = "Wow! Your daily goals is almost done!";
  static const completedTasks = "{d} of {a} completed!";
  static const todayTasks = "Today Tasks (#)";
  static const seeAllTitle = "See All";

  // colors
  static const whiteColor = Color(0xffF2F2F2);
  static const cyanColor = Color(0xff5CB8E4);
  static const purpleColor = Color(0xff8758FF);
  static const blackColor = Color(0xff181818);
  static const limeColor = Color(0xffF0FF42);
  static const pinkColor = Color(0xffFF74B1);

  // app theme
  static getTheme(BuildContext context) => ThemeData(
        primaryColor: purpleColor,
        scaffoldBackgroundColor: blackColor,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: false,
          iconTheme: IconThemeData(
            color: cyanColor,
          ),
        ),
        iconTheme: const IconThemeData(
          color: cyanColor,
        ),
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.normal,
        ),
        textTheme: Theme.of(context)
            .textTheme
            .copyWith(button: const TextStyle(color: whiteColor))
            .apply(
              bodyColor: whiteColor,
              displayColor: whiteColor,
            ),
      );
}
