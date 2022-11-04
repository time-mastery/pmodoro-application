import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pomodore/core/constant/constant.dart';
import 'package:pomodore/core/utils/size_config.dart';
import 'package:pomodore/core/widgets/base_app_bar.dart';
import 'package:pomodore/features/tasks/presentation/pages/add_task_page.dart';
import 'package:pomodore/features/tasks/presentation/widgets/task_item.dart';

import '../../../../exports.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;

    final tasks = [
      "Deutsch lernen",
      "English",
      "Sport",
      "Cleaning",
      "Listen",
      "CarWash",
      "Call",
      "Rufen",
    ];
    return Scaffold(
      appBar: BaseAppBar(
        title: localization.tasksTitle,
        action:
            tasks.isEmpty ? null : const Icon(CupertinoIcons.add_circled_solid),
        onPressed: tasks.isEmpty
            ? null
            : () => Navigator.pushNamed(
                  context,
                  AddTaskPage.routeName,
                ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: SizeConfig.widthMultiplier * 100,
            child: CalendarTimeline(
              initialDate: DateTime(DateTime.now().year, DateTime.now().month,
                  DateTime.now().day),
              firstDate: DateTime(2022, 1, 15),
              lastDate: DateTime(2030, 11, 20),
              onDateSelected: (date) {},
              leftMargin: 20,
              monthColor: AppConstant.cyanColor,
              dayColor: AppConstant.cyanColor,
              activeDayColor: AppConstant.blackColor,
              activeBackgroundDayColor: AppConstant.pinkColor,
              dotsColor: AppConstant.blackColor,
            ),
          ),
          tasks.isNotEmpty
              ? Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.only(top: 20),
                    itemCount: tasks.length,
                    itemBuilder: (context, index) => TaskItem(
                      color: Colors.primaries[index % 17],
                      title: "title",
                      time: '10:00 - 20:00',
                    ),
                    separatorBuilder: (BuildContext context, int index) {
                      if (index == 2) {
                        return Column(
                          children: const [
                            Divider(
                              color: AppConstant.cyanColor,
                              thickness: 8,
                              endIndent: 20,
                              indent: 20,
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                )
              : Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 10,
                    ),
                    const Icon(
                      Ionicons.document_text,
                      size: 150,
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 5,
                    ),
                    Text(
                      localization.emptyTaskListTitle,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.cyanAccent),
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 2,
                    ),
                    Text(localization.emptyTaskListHint),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 2,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.add_circled_solid),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
