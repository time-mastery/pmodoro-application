import "package:flutter/material.dart";
import "package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:pomodore/core/constant/constant.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";

class HabitItemWidget extends HookWidget {
  const HabitItemWidget({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    var submitAnimationController = useAnimationController();

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
                    child: const Center(
                      child: Icon(
                        Icons.energy_savings_leaf,
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
                          "Title",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          "This is a long description this is a long ss disss s sdf",
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
                    datasets: const {},
                    showColorTip: false,
                    colorsets: {1: Theme.of(context).colorScheme.secondary},
                    colorTipCount: 10,
                    onClick: (value) {},
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: color.withOpacity(.2),
                          borderRadius: BorderRadius.circular(
                            AppConstant.radius,
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              color: color.withOpacity(.3),
                              size: AppConstant.iconSize,
                            ),
                            10.spaceW(),
                            const Text("UnComplete")
                          ],
                        ),
                      ),
                    ),
                    10.spaceW(),
                    Container(
                        decoration: BoxDecoration(
                          color: color.withOpacity(.2),
                          borderRadius: BorderRadius.circular(
                            AppConstant.radius,
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Text("Duratoin")),
                    10.spaceW(),
                    Container(
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
                    10.spaceW(),
                    Container(
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
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
