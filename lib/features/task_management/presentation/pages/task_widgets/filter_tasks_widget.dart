import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:pomodore/core/resources/enums/tasks_filter_enums.dart";
import "package:pomodore/core/utils/debug_print.dart";
import "package:pomodore/features/task_management/presentation/blocs/tasks_bloc/tasks_bloc.dart";

import "../../../domain/entities/task_entity.dart";

class FilterTasksWidget extends StatelessWidget {
  const FilterTasksWidget({super.key, required this.list});

  final List<TaskEntity> list;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        int index = 0;

        if (state is FilterTaskSuccess) {
          dPrint("called");
          index = state.index;
        }

        return SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<TasksBloc>().add(
                        TasksFiltered(
                          filterMode: TasksFilterEnum.all,
                          list: list,
                        ),
                      );
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: (index == 0)
                        ? Theme.of(context).colorScheme.onBackground
                        : null,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  child: Text(
                    "All Tasks",
                    style: TextStyle(
                      color: (index == 0)
                          ? Theme.of(context).colorScheme.background
                          : null,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<TasksBloc>().add(
                        TasksFiltered(
                          filterMode: TasksFilterEnum.unCompleted,
                          list: list,
                        ),
                      );
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: (index == 1)
                        ? Theme.of(context).colorScheme.onBackground
                        : null,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  child: Text(
                    "UnCompleted",
                    style: TextStyle(
                      color: (index == 1)
                          ? Theme.of(context).colorScheme.background
                          : null,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<TasksBloc>().add(
                        TasksFiltered(
                          filterMode: TasksFilterEnum.completed,
                          list: list,
                        ),
                      );
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: (index == 2)
                        ? Theme.of(context).colorScheme.onBackground
                        : null,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  child: Text(
                    "Completed",
                    style: TextStyle(
                      color: (index == 2)
                          ? Theme.of(context).colorScheme.background
                          : null,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
