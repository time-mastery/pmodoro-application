import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";
import "package:pomodore/core/utils/responsive/size_config.dart";
import "package:pomodore/features/configuration/presentation/blocs/base_bloc/base_bloc.dart";
import "package:pomodore/features/task_management/models/task_model.dart";
import "package:pomodore/features/task_management/providers/task_management_providers.dart";

import "../../../../di.dart";
import "../../../../exports.dart";
import "../shared/home_task_item.dart";

class HomeTasksList extends ConsumerWidget {
  const HomeTasksList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(uncompletedTasksProvider);

    final AppLocalizations localization = AppLocalizations.of(context)!;
    List<TaskModel> list = [];

    if (asyncData is AsyncData<List<TaskModel>>) {
      list = asyncData.value;
    }

    if (list.isEmpty) {
      return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(localization.emptyTaskListTitle,
                style: Theme.of(context).textTheme.headlineSmall),
            (SizeConfig.heightMultiplier * 2).spaceH(),
            Text(
              localization.emptyTaskListHint,
              textAlign: TextAlign.center,
            ),
            (SizeConfig.heightMultiplier * 2).spaceH(),
            IconButton(
              onPressed: () =>
                  getIt.get<BaseBloc>().add(const PageIndexChanged(1)),
              icon: const Icon(CupertinoIcons.add_circled_solid),
            ),
          ],
        ),
      );
    }

    return Expanded(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => HomeTaskItem(item: list[index]),
      ),
    );
  }
}
