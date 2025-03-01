import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pomodore/core/constant/constant.dart";
import "package:pomodore/core/extensions/datetime_extensions.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";
import "package:pomodore/core/resources/params/task_params.dart";
import "package:pomodore/core/shared_widgets/global_button.dart";
import "package:pomodore/core/shared_widgets/global_indicator.dart";
import "package:pomodore/features/task_management/blocs/tasks_bloc/tasks_bloc.dart";
import "package:pomodore/features/task_management/models/task_model.dart";
import "package:pomodore/features/task_management/providers/task_management_providers.dart";
import "package:pomodore/features/task_management/views/edit_task_page.dart";

import "../../../../core/utils/responsive/size_config.dart";
import "../../../../exports.dart";

class TaskItem extends ConsumerWidget {
  const TaskItem({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations localization = AppLocalizations.of(context)!;
    final asyncDeleteTask = ref.watch(deleteTaskProvider);

    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Theme.of(context).colorScheme.surface,
          elevation: 20,
          isScrollControlled: true,
          builder: (context) {
            return FractionallySizedBox(
              heightFactor: (!task.done) ? .3 : .2,
              child: Padding(
                padding: const EdgeInsets.all(AppConstant.modalPadding),
                child: Column(
                  children: [
                    Text(
                      localization.taskManagementTitle,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    (SizeConfig.heightMultiplier * 3).spaceH(),
                    Row(
                      children: [
                        if (!task.done)
                          Expanded(
                            child: GlobalButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                        context, EditTaskPage.routeName,
                                        arguments: task)
                                    .then((value) {
                                  //TODO ref invalidate
                                  ref.refresh(tasksProvider.future);
                                  Navigator.pop(context);
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(localization.editTaskTitle),
                                  (SizeConfig.heightMultiplier * 2).spaceW(),
                                  const Icon(Icons.edit),
                                ],
                              ),
                            ),
                          ),
                        if (!task.done)
                          (SizeConfig.heightMultiplier * 2).spaceW(),
                        Expanded(
                          child: GlobalButton(
                            onPressed: () {
                              ref
                                  .read(deleteTaskProvider.notifier)
                                  .deleteTask(task.id);
                            },
                            child: asyncDeleteTask.isLoading
                                ? const GlobalIndicator()
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(localization.deleteTaskTitle),
                                      (SizeConfig.heightMultiplier * 2)
                                          .spaceW(),
                                      const Icon(Icons.delete),
                                    ],
                                  ),
                          ),
                        ),
                      ],
                    ),
                    (SizeConfig.heightMultiplier * 1).spaceH(),
                    if (!task.done)
                      GlobalButton(
                        width: double.infinity,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        onPressed: () {
                          ref
                              .read(editTaskProvider.notifier)
                              .editTask(TaskParams(
                                id: task.id,
                                taskDone: !task.done,
                                uid: task.uid,
                                taskDoneDatetime: task.doneTime,
                                taskTitle: task.title,
                                taskDescription: task.description,
                                taskDateTimeDeadline: task.deadLineTime,
                              ));
                        },
                        child: Text(
                          localization.completeTaskTitle,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Row(
          children: [
            Text(task.deadLineTime.taskTimeFormat()),
            (SizeConfig.heightMultiplier * 2).spaceW(),
            Expanded(
              child: Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              decoration:
                                  task.done ? TextDecoration.lineThrough : null,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        task.description,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                              decoration:
                                  task.done ? TextDecoration.lineThrough : null,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      (SizeConfig.heightMultiplier * 1).spaceH(),
                      Text(
                        task.deadLineTime.taskDateFormat(),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              decoration:
                                  task.done ? TextDecoration.lineThrough : null,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
