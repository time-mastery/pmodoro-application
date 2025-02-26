import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter/material.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";
import "package:pomodore/core/utils/responsive/size_config.dart";
import "package:pomodore/core/utils/utils.dart";
import "package:pomodore/exports.dart";

import "package:pomodore/features/task_management/models/daily_information_model.dart";
import "package:pomodore/features/task_management/providers/task_management_providers.dart";

class HomeGoalWidget extends ConsumerWidget {
  const HomeGoalWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(homeProvider);
    final AppLocalizations localization = AppLocalizations.of(context)!;
    DailyInformationModel? dailyItem;

    if (asyncData is AsyncData<DailyInformationModel>) {
      dailyItem = asyncData.value;
    }

    return SizedBox(
      width: SizeConfig.widthMultiplier * 100,
      height: SizeConfig.heightMultiplier * 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Card(
          child: Padding(
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
                                .withAlpha(20),
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
                (SizeConfig.heightMultiplier * 4).spaceW(),
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
                      (SizeConfig.heightMultiplier * 2).spaceH(),
                      Text(
                        dailyItem == null
                            ? "- - - - - -"
                            : localization.completedTasks(
                                dailyItem.dailyGoalQuantity.toString(),
                                dailyItem.completedTaskQuantity.toString(),
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
          ),
        ),
      ),
    );
  }
}
