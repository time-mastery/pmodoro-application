import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:pomodore/core/utils/responsive/size_config.dart";
import "package:pomodore/features/task_management/domain/entities/daily_information_entity.dart";
import "package:pomodore/features/task_management/presentation/blocs/home_bloc/home_bloc.dart";

import "../../../../../core/utils/utils.dart";
import "../../../../../exports.dart";

class HomeGoalWidget extends StatelessWidget {
  const HomeGoalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;
    DailyInformationEntity? dailyItem;

    return SizedBox(
      width: SizeConfig.widthMultiplier * 100,
      height: SizeConfig.heightMultiplier * 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Card(
          child: BlocBuilder(
            bloc: context.read<HomeBloc>(),
            builder: (context, state) {
              if (state is FetchHomeDataSuccess) dailyItem = state.item;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 20,
                      height: SizeConfig.widthMultiplier * 20,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: SizeConfig.widthMultiplier * 20,
                              height: SizeConfig.widthMultiplier * 20,
                              child: CircularProgressIndicator(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(.2),
                                value: dailyItem?.processPercentage ?? 0,
                                strokeWidth: 10,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "${((dailyItem?.processPercentage ?? 0) * 100).toString()} %",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: SizeConfig.widthMultiplier * 4),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Utils.getProcessTitle(
                                context, dailyItem?.processPercentage ?? 0),
                            style: Theme.of(context).textTheme.titleLarge,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: SizeConfig.heightMultiplier * 2),
                          Text(
                            dailyItem == null
                                ? "- - - - - -"
                                : localization.completedTasks(
                                    dailyItem!.dailyGoalQuantity.toString(),
                                    dailyItem!.completedTaskQuantity.toString(),
                                  ),
                            style: Theme.of(context).textTheme.bodySmall,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
