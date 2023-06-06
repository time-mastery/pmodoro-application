import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:pomodore/core/constant/constant.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";
import "package:pomodore/core/resources/params/habit_params.dart";
import "package:pomodore/core/utils/icon_converter.dart";
import "package:pomodore/features/habit_tracking/domain/entities/habit_entity.dart";
import "package:pomodore/features/habit_tracking/presentation/blocs/habit_tracker_bloc/habit_tracker_bloc.dart";
import "package:pomodore/features/habit_tracking/presentation/pages/add_habit_page.dart";

import "../../../../exports.dart";

class HabitItemWidget extends HookWidget {
  const HabitItemWidget({super.key, required this.item, required this.habits});

  final HabitEntity item;
  final List<HabitEntity> habits;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;

    var color = Color(item.color);

    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: EdgeInsets.zero,
              title: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: color.withOpacity(.2),
                      borderRadius: BorderRadius.circular(AppConstant.radius),
                    ),
                    child: Center(
                      child: Icon(
                        IconConverter.icons[item.iconName],
                        size: AppConstant.iconSize,
                      ),
                    ),
                  ),
                  10.spaceW(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          item.desctription,
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              children: [
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: HeatMap(
                    size: 15,
                    scrollable: true,
                    fontSize: 0,
                    showText: false,
                    defaultColor: color.withOpacity(.2),
                    colorMode: ColorMode.opacity,
                    datasets: item.overviews,
                    showColorTip: false,
                    colorsets: {1: Theme.of(context).colorScheme.secondary},
                    colorTipCount: 10,
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<HabitTrackerBloc>().add(
                              HabitDone(
                                HabitOverviewParams(
                                    item.id, item.isCompleteToday),
                                habits,
                              ),
                            );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: item.isCompleteToday
                              ? Theme.of(context).colorScheme.primary
                              : color.withOpacity(.2),
                          borderRadius: BorderRadius.circular(
                            AppConstant.radius,
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              color: item.isCompleteToday
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : color.withOpacity(.3),
                              size: AppConstant.iconSize,
                            ),
                            10.spaceW(),
                            Text(
                              item.isCompleteToday
                                  ? localization.completedHabit
                                  : localization.completeHabit,
                              style: TextStyle(
                                color: item.isCompleteToday
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : null,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddHabitPage(
                              item: item,
                              habits: habits,
                            ),
                          ),
                        ).then(
                          (value) => context.read<HabitTrackerBloc>().add(
                                HabitUpdated(
                                  value,
                                  habits,
                                ),
                              ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: color.withOpacity(.2),
                          borderRadius: BorderRadius.circular(
                            AppConstant.radius,
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.edit,
                          size: AppConstant.iconSize,
                        ),
                      ),
                    ),
                    10.spaceW(),
                    GestureDetector(
                      onTap: () => showDeleteConfirmationDialog(
                          context, context.read<HabitTrackerBloc>()),
                      child: Container(
                        decoration: BoxDecoration(
                          color: color.withOpacity(.2),
                          borderRadius: BorderRadius.circular(
                            AppConstant.radius,
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.delete,
                          size: AppConstant.iconSize,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showDeleteConfirmationDialog(
      BuildContext context, HabitTrackerBloc bloc) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Confirmation"),
          content: const Text("Are you sure you want to delete this item?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text("Delete"),
              onPressed: () {
                bloc.add(
                  HabitDeleted(item.id, habits),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
