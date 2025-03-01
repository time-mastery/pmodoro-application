import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:pomodore/core/resources/enums/tasks_filter_enums.dart";
import "package:pomodore/core/utils/debug_print.dart";
import "package:pomodore/features/task_management/models/task_model.dart";

class FilterTasksWidget extends StatelessWidget {
  const FilterTasksWidget({super.key, required this.list});

  final List<TaskModel> list;

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
                        ? Theme.of(context).colorScheme.onSurface
                        : null,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  child: Text(
                    "All Tasks",
                    style: TextStyle(
                      color: (index == 0)
                          ? Theme.of(context).colorScheme.surface
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
                        ? Theme.of(context).colorScheme.onSurface
                        : null,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  child: Text(
                    "UnCompleted",
                    style: TextStyle(
                      color: (index == 1)
                          ? Theme.of(context).colorScheme.surface
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
                        ? Theme.of(context).colorScheme.onSurface
                        : null,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  child: Text(
                    "Completed",
                    style: TextStyle(
                      color: (index == 2)
                          ? Theme.of(context).colorScheme.surface
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
