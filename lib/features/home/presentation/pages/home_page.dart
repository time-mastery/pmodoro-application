import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pomodore/core/constant/constant.dart';
import 'package:pomodore/features/settings/presentation/pages/settings_page.dart';
import 'package:pomodore/features/timer/presentation/pages/timer_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 2;

  final List<Widget> _pages = [
    const Scaffold(),
    const Scaffold(),
    const TimerPage(),
    const Scaffold(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MoveWindow(
      child: Scaffold(
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
            const BottomNavigationBarItem(
                icon: Icon(Ionicons.people), label: AppConstant.profileTab),
            const BottomNavigationBarItem(
                icon: Icon(Ionicons.settings_outline),
                label: AppConstant.settingTab),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
        body: _pages[_bottomNavIndex],
      ),
    );
  }
}
