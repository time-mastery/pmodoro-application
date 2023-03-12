import "package:flutter/material.dart";
import "package:pomodore/core/shared_widgets/base_app_bar.dart";

import "../../../../exports.dart";

class AllTodayTasksPage extends StatelessWidget {
  const AllTodayTasksPage({Key? key}) : super(key: key);

  static const routeName = "/appTodayTasks";

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;

    return Scaffold(
        appBar: BaseAppBar(
          title: localization.todayTasks.replaceAll("#", "16"),
          hasBackBtn: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => Container(),
          ),
        ));
  }
}
