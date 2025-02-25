import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:ionicons/ionicons.dart";
import "package:pomodore/features/configuration/presentation/blocs/base_bloc/base_bloc.dart";
import "package:pomodore/features/configuration/presentation/pages/settings_page.dart";
import "package:pomodore/features/habit_tracking/presentation/pages/habit_tracking_page.dart";

import "../../../../exports.dart";
import "../../../task_management/presentation/pages/home_page.dart";
import "../../../task_management/presentation/pages/tasks_page.dart";
import "../../../task_management/presentation/pages/timer_page.dart";

class BasePage extends StatelessWidget {
  BasePage({super.key});

  static const routeName = "/base";

  final List<Widget> _pages = [
    const HomePage(),
    const TasksPage(),
    const HabitTrackingPage(),
    const TimerPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;
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
            const BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: ""),
            BottomNavigationBarItem(
              icon: Container(
                width: 40,
                height: 40,
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
            BottomNavigationBarItem(
                icon: const Icon(Ionicons.settings_outline),
                label: localization.settingTab),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
      body: _pages[(state).index],
    );
  }
}
