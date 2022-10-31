import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pomodore/core/constant/constant.dart';
import 'package:pomodore/features/home/presentation/pages/home_page.dart';
import 'package:pomodore/features/settings/presentation/pages/settings_page.dart';
import 'package:pomodore/features/tasks/presentation/pages/tasks_page.dart';
import 'package:pomodore/features/timer/presentation/pages/timer_page.dart';

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
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppConstant.cyanColor,
        currentIndex: _bottomNavIndex,
        onTap: (value) {
          _bottomNavIndex = value;
          setState(() {});
        },
        selectedItemColor: AppConstant.purpleColor,
        unselectedItemColor: AppConstant.blackColor,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Ionicons.home), label: AppConstant.homeTab),
          const BottomNavigationBarItem(
              icon: Icon(Ionicons.book), label: AppConstant.tasksTab),
          const BottomNavigationBarItem(
              icon: Icon(Ionicons.settings_outline),
              label: AppConstant.settingTab),
          BottomNavigationBarItem(
              icon: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  color: AppConstant.purpleColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Ionicons.timer_outline,
                  color: Colors.white,
                ),
              ),
              label: AppConstant.timerTab),
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
