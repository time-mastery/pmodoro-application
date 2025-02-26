import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pomodore/features/task_management/models/task_model.dart";
import "package:pomodore/features/task_management/providers/task_management_providers.dart";

import "../../../../exports.dart";

class HomeTaskCountWidget extends ConsumerWidget {
  const HomeTaskCountWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(uncompletedTasksProvider);
    final AppLocalizations localization = AppLocalizations.of(context)!;

    return Text(
      localization.remainTaskTitle.replaceAll(
          "#",
          ((asyncData is AsyncData<List<TaskModel>>)
              ? asyncData.value.length.toString()
              : "-")),
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
