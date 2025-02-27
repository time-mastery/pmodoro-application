import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:ionicons/ionicons.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";
import "package:pomodore/core/shared_widgets/global_button.dart";
import "package:pomodore/features/configuration/presentation/blocs/base_bloc/base_bloc.dart";

import "package:pomodore/features/task_management/models/task_model.dart";
import "package:pomodore/features/task_management/providers/task_management_providers.dart";

import "../../../../core/utils/responsive/size_config.dart";
import "../../../../core/utils/utils.dart";

class HomeTaskItem extends ConsumerWidget {
  const HomeTaskItem({super.key, required this.item});

  final TaskModel item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        width: SizeConfig.widthMultiplier * 85,
        height: SizeConfig.heightMultiplier * 12,
        child: Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.all(11.0),
                    child: Icon(
                      Ionicons.ice_cream,
                    ),
                  ),
                ),
                (SizeConfig.heightMultiplier * 3).spaceW(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: Theme.of(context).textTheme.titleLarge,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        item.description,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      5.spaceH(),
                      Text(
                        Utils.calculateRemainingTime(item.deadLineTime),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Utils.getTaskDeadlineStatusColor(
                                  item.deadLineTime),
                            ),
                      ),
                    ],
                  ),
                ),
                10.spaceW(),
                GlobalButton(
                  width: SizeConfig.widthMultiplier * 14,
                  height: SizeConfig.widthMultiplier * 14,
                  onPressed: () {
                    ref.read(timerTaskProvider.notifier).updateTask(item);

                    context.read<BaseBloc>().add(const PageIndexChanged(3));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
