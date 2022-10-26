import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pomodore/core/constant/constant.dart';
import 'package:pomodore/features/home/presentation/widgets/home_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 3;

  @override
  Widget build(BuildContext context) {
    return MoveWindow(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _bottomNavIndex,
          onTap: (value) {
            _bottomNavIndex = value;
            setState(() {});
          },
          selectedItemColor: AppConstant.orangeColor,
          unselectedItemColor: AppConstant.orangeColor.withOpacity(.2),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Ionicons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Ionicons.book), label: "Tasks"),
            BottomNavigationBarItem(
                icon: Icon(Ionicons.people), label: "Profile"),
            BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: AppConstant.orangeColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Ionicons.timer_outline,
                    color: Colors.white,
                  ),
                ),
                label: "Timer"),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
        appBar: HomeAppBar(),
      ),
    );
  }
}
