import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pomodore/features/configuration/presentation/blocs/base_bloc/base_bloc.dart';
import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';
import 'package:pomodore/features/task_management/presentation/blocs/timer_bloc/timer_bloc.dart';

import '../../../../core/utils/responsive/size_config.dart';
import '../../../../exports.dart';

class TimerTask extends StatelessWidget {
  const TimerTask(
      {Key? key,
      required this.title,
      required this.count,
      required this.targetCount,
      required this.totalTime})
      : super(key: key);

  final String title;
  final double totalTime;
  final int count;
  final int targetCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.widthMultiplier * 85,
      height: SizeConfig.heightMultiplier * 11,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Material(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: const Padding(
              padding: EdgeInsets.all(11.0),
              child: Icon(
                Ionicons.ice_cream,
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.widthMultiplier * 2,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "$totalTime Minutes",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Text(
            "$count / $targetCount",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}

class SelectATaskToStart extends StatelessWidget {
  const SelectATaskToStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;
    var theme = Theme.of(context).textTheme;
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (previous, current) {
        return (current is SelectTaskSuccess || current is DeSelectTaskSuccess);
      },
      builder: (context, state) {
        TaskEntity? taskItem = context.read<TimerBloc>().taskItem;

        if (state is SelectTaskSuccess) {
          taskItem = state.taskItem;
        }

        if (state is DeSelectTaskSuccess) {
          taskItem = null;
        }

        return InkWell(
          onTap: () {
            context.read<BaseBloc>().add(const PageIndexChanged(0));
          },
          child: SizedBox(
            width: SizeConfig.widthMultiplier * 60,
            height: SizeConfig.heightMultiplier * 6,
            child: Card(
              child: Center(
                child: (taskItem != null)
                    ? Text(
                        taskItem.title,
                        style: theme.titleLarge,
                      )
                    : Text(localization.selectTaskTitle),
              ),
            ),
          ),
        );
      },
    );
  }
}
