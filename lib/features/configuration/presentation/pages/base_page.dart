import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pomodore/core/constant/constant.dart';
import 'package:pomodore/features/configuration/presentation/pages/settings_page.dart';
import 'package:pomodore/features/task_management/presentation/pages/home_page.dart';
import 'package:pomodore/features/task_management/presentation/pages/tasks_page.dart';
import 'package:pomodore/features/task_management/presentation/pages/timer_page.dart';

import '../../../../exports.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  static const routeName = "/base";

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _bottomNavIndex = 3;

  final List<Widget> _pages = [
    const HomePage(),
    const TasksPage(),
    const SettingsPage(),
    const TimerPage(),
    // const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppConstant.secondaryColor,
        currentIndex: _bottomNavIndex,
        onTap: (value) {
          _bottomNavIndex = value;
          setState(() {});
        },
        selectedItemColor: AppConstant.primaryColor,
        unselectedItemColor: AppConstant.scaffoldColor,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Ionicons.home), label: localization.homeTab),
          BottomNavigationBarItem(
              icon: const Icon(Ionicons.book), label: localization.tasksTab),
          BottomNavigationBarItem(
              icon: const Icon(Ionicons.settings_outline),
              label: localization.settingTab),
          BottomNavigationBarItem(
              icon: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  color: AppConstant.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Ionicons.timer_outline,
                  color: Colors.white,
                ),
              ),
              label: localization.timerTab),
          // const BottomNavigationBarItem(
          //     icon: Icon(Ionicons.people), label: AppConstant.profileTab),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      body: _pages[_bottomNavIndex],
    );
  }
}
