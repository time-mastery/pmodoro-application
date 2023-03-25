import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";

class BarChartWidget extends HookWidget {
  const BarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final touchedIndex = useState(-1);
    const Duration animDuration = Duration(milliseconds: 250);
    final xDayNamesList = ["M", "T", "W", "T", "F", "S", "S"];
    final weekDaysFullNameList = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];

    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Weekly Spending",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                38.spaceH(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: BarChart(
                      BarChartData(
                        barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                            tooltipBgColor: Colors.blueGrey,
                            tooltipHorizontalAlignment:
                                FLHorizontalAlignment.right,
                            tooltipMargin: -10,
                            getTooltipItem:
                                (group, groupIndex, rod, rodIndex) =>
                                    BarTooltipItem(
                              "${weekDaysFullNameList[group.x]}\n",
                              const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: (rod.toY - 1).toString(),
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          touchCallback:
                              (FlTouchEvent event, barTouchResponse) {
                            if (!event.isInterestedForInteractions ||
                                barTouchResponse == null ||
                                barTouchResponse.spot == null) {
                              touchedIndex.value = -1;
                              return;
                            }
                            touchedIndex.value =
                                barTouchResponse.spot!.touchedBarGroupIndex;
                          },
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) => SideTitleWidget(
                                axisSide: meta.axisSide,
                                space: 16,
                                child: Text(
                                  xDayNamesList[value.toInt()],
                                ),
                              ),
                              reservedSize: 38,
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        barGroups: List.generate(
                            7,
                            (i) => makeGroupData(
                                  context,
                                  x: i,
                                  y: 10,
                                  isTouched: i == touchedIndex.value,
                                )),
                        gridData: FlGridData(show: false),
                      ),
                      swapAnimationDuration: animDuration,
                    ),
                  ),
                ),
                12.spaceH(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
    BuildContext context, {
    required int x,
    required double y,
    bool isTouched = false,
    Color? barColor,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    barColor ??= barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched
              ? Theme.of(context).colorScheme.error
              : Theme.of(context).colorScheme.secondary,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: Colors.white.withOpacity(.3))
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: Theme.of(context).colorScheme.onBackground.withOpacity(.2),
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }
}
