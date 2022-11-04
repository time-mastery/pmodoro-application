import 'package:flutter/material.dart';
import 'package:pomodore/core/widgets/base_app_bar.dart';

import '../../../../exports.dart';
import '../widgets/home_task_item.dart';

class AllTodayTasksPage extends StatelessWidget {
  const AllTodayTasksPage({Key? key}) : super(key: key);

  static const routeName = "/appTodayTasks";

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;

    return Scaffold(
        appBar: BaseAppBar(
          title: localization.todayTasks.replaceAll("#", "16"),
          hasBackBtn: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => HomeTaskItem(
              title: "Task $index",
              time: index,
            ),
          ),
        ));
  }
}
