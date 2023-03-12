import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:ionicons/ionicons.dart";
import "package:pomodore/core/shared_widgets/global_button.dart";
import "package:pomodore/features/configuration/presentation/blocs/base_bloc/base_bloc.dart";
import "package:pomodore/features/task_management/domain/entities/task_entity.dart";
import "package:pomodore/features/task_management/presentation/blocs/timer_bloc/timer_bloc.dart";

import "../../../../core/utils/responsive/size_config.dart";

class HomeTaskItem extends StatelessWidget {
  const HomeTaskItem({Key? key, required this.item}) : super(key: key);

  final TaskEntity item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        width: SizeConfig.widthMultiplier * 85,
        height: SizeConfig.heightMultiplier * 12,
        child: Card(
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
                SizedBox(
                  width: SizeConfig.widthMultiplier * 3,
                ),
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
                    ],
                  ),
                ),
                GlobalButton(
                  width: SizeConfig.widthMultiplier * 14,
                  height: SizeConfig.widthMultiplier * 14,
                  onPressed: () {
                    context.read<TimerBloc>().add(TimerTaskSelected(item));
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
