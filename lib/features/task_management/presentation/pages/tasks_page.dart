import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:pomodore/core/shared_widgets/base_app_bar.dart";
import "package:pomodore/core/shared_widgets/global_indicator.dart";
import "package:pomodore/features/task_management/presentation/blocs/tasks_bloc/tasks_bloc.dart";
import "package:pomodore/features/task_management/presentation/pages/add_task_page.dart";
import "package:pomodore/features/task_management/presentation/pages/task_widgets/day_without_task_widget.dart";

import "../../../../di.dart";
import "../../../../exports.dart";
import "../widgets/task_item.dart";

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TasksBloc>(
      create: (context) =>
          getIt.get<TasksBloc>()..add(SpecificDateTasksFetched(DateTime.now())),
      child: const TaskView(),
    );
  }
}

class TaskView extends StatelessWidget {
  const TaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;

    return BlocConsumer<TasksBloc, TasksState>(
      listener: (context, state) {
        if (state is TaskCompleteSuccess ||
            state is EditTaskSuccess ||
            state is TaskDeleteSuccess) {
          context
              .read<TasksBloc>()
              .add(SpecificDateTasksFetched(DateTime.now()));
          Navigator.pop(context);
        }

        if (state is TaskCompleteFailure || state is TaskDeleteFailure) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: BaseAppBar(
            title: localization.tasksTitle,
            action: (state is SpecificDateTasksReceivedSuccess &&
                    state.list.isNotEmpty)
                ? const Icon(CupertinoIcons.add_circled_solid)
                : null,
            onPressed: (state is SpecificDateTasksReceivedSuccess &&
                    state.list.isNotEmpty)
                ? () => Navigator.pushNamed(context, AddTaskPage.routeName)
                    .then((_) => context
                        .read<TasksBloc>()
                        .add(SpecificDateTasksFetched(DateTime.now())))
                : null,
          ),
          body: Column(
            children: [
              if (state is SpecificDateTasksReceivedSuccess &&
                  state.list.isEmpty)
                const DayWithoutTask(),
              if (state is SpecificDateTasksReceivedSuccess)
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.only(top: 20),
                    itemCount: state.list.length,
                    itemBuilder: (context, index) =>
                        TaskItem(task: state.list[index]),
                    separatorBuilder: (BuildContext context, int index) {
                      return Container();
                    },
                  ),
                ),
              if (state is SpecificDateTasksReceivedFailure)
                const Center(child: Text("error")),
              if (state is SpecificDateTasksReceivedLoading)
                const GlobalIndicator(),
              Container(),
            ],
          ),
        );
      },
    );
  }
}
