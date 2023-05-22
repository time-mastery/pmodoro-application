import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

import "package:flutter_hooks/flutter_hooks.dart";
import "package:pomodore/core/shared_widgets/base_app_bar.dart";
import "package:pomodore/features/habit_tracking/presentation/pages/add_habit_page.dart";
import "package:pomodore/features/habit_tracking/presentation/shared_widgets/habit_item_widget.dart";

import "../../../../exports.dart";

class HabitTrackingPage extends StatelessWidget {
  const HabitTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HabitTrackingView();
  }
}

class HabitTrackingView extends HookWidget {
  const HabitTrackingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;

    var habitList = [
      "Deutsch",
      "Persian",
      "Anki",
      "Anki",
      "Anki",
      "Anki",
      "Anki",
      "Anki",
      "Anki",
      "Anki",
      "Anki",
      "Anki",
      "Starten wir",
    ];
    return Scaffold(
      appBar: BaseAppBar(
        title: localization.habitTrackingTitle,
        action: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AddHabitPage.routeName);
          },
          icon: const Icon(CupertinoIcons.add_circled_solid),
        ),
      ),
      body: habitList.isEmpty
          ? Center(
              child: Text(
                localization.noHabitMessage,
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: habitList.length,
              itemBuilder: (context, index) => ListTile(
                title: HabitItemWidget(
                  color: Colors.primaries[index % Colors.primaries.length],
                ),
              ),
            ),
    );
  }
}
