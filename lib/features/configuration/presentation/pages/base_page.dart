import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pomodore/features/configuration/presentation/blocs/base_bloc/base_bloc.dart';
import 'package:pomodore/features/configuration/presentation/pages/settings_page.dart';

import '../../../../exports.dart';
import '../../../task_management/presentation/pages/home_page.dart';
import '../../../task_management/presentation/pages/tasks_page.dart';
import '../../../task_management/presentation/pages/timer_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  static const routeName = "/base";

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
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
    final state = context.watch<BaseBloc>().state;

    return Scaffold(
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.ltr,
        child: BottomNavigationBar(
          currentIndex: (state as PageChangeSuccess).index,
          onTap: (value) {
            context.read<BaseBloc>().add(PageIndexChanged(value));
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Ionicons.home),
              label: localization.homeTab,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Ionicons.book),
              label: localization.tasksTab,
            ),
            BottomNavigationBarItem(
                icon: const Icon(Ionicons.settings_outline),
                label: localization.settingTab),
            BottomNavigationBarItem(
              icon: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Ionicons.timer_outline,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              label: localization.timerTab,
            ),
            // const BottomNavigationBarItem(
            //     icon: Icon(Ionicons.people), label: AppConstant.profileTab),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
      body: _pages[(state).index],
    );
  }
}
