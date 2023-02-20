import 'package:flutter/material.dart';
import 'package:pomodore/core/constant/constant.dart';
import 'package:pomodore/core/extensions/datetime_extensions.dart';
import 'package:pomodore/core/shared_widgets/global_button.dart';
import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';

import '../../../../core/utils/responsive/size_config.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    Key? key,
    required this.task,
  }) : super(key: key);

  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Theme.of(context).colorScheme.background,
          isScrollControlled: true,
          builder: (context) {
            return FractionallySizedBox(
              heightFactor: .3,
              child: Padding(
                padding: const EdgeInsets.all(AppConstant.modalPadding),
                child: Column(
                  children: [
                    Text(
                      "Task management",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 3,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GlobalButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Edit Task"),
                                SizedBox(
                                  width: SizeConfig.widthMultiplier * 2,
                                ),
                                const Icon(Icons.edit),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 2,
                        ),
                        Expanded(
                          child: GlobalButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Delete Task"),
                                SizedBox(
                                  width: SizeConfig.widthMultiplier * 2,
                                ),
                                const Icon(Icons.delete),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier,
                    ),
                    GlobalButton(
                      width: double.infinity,
                      title: "Complete Task",
                      titleStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(
                              color: Theme.of(context).colorScheme.onSecondary),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
            SizedBox(width: SizeConfig.widthMultiplier * 2),
            Expanded(
              child: SizedBox(
                height: SizeConfig.heightMultiplier * 11,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task.title,
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          task.description,
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: SizeConfig.heightMultiplier * 1),
                        Text(
                          task.deadLineTime.taskDateFormat(),
                          style: Theme.of(context).textTheme.labelSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
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
