

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:ionicons/ionicons.dart";
import "package:pomodore/core/utils/responsive/size_config.dart";
import "package:pomodore/features/task_management/presentation/blocs/tasks_bloc/tasks_bloc.dart";
import "package:pomodore/features/task_management/presentation/pages/add_task_page.dart";

import "../../../../../exports.dart";



class DayWithoutTask extends StatelessWidget {
  const DayWithoutTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;

    return Column(
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
        Text(localization.emptyTaskListTitle,
            style: Theme.of(context).textTheme.headlineSmall),
        SizedBox(
          height: SizeConfig.heightMultiplier * 2,
        ),
        Text(
          localization.emptyTaskListHint,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 2,
        ),
        IconButton(
          onPressed: () => Navigator.pushNamed(context, AddTaskPage.routeName)
              .then((value) => context
                  .read<TasksBloc>()
                  .add(SpecificDateTasksFetched(DateTime.now()))),
          icon: const Icon(CupertinoIcons.add_circled_solid),
        ),
      ],
    );
  }
}
