import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:intl/intl.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";

List<String> createListOfWeekDaySingleCharTitle() {
  List<String> weekDays = [];
  for (var i = 0; i < 7; i++) {
    final DateTime date = DateTime.now().subtract(Duration(days: i));
    final DateFormat formatter = DateFormat("EEEE");
    final String formatted = formatter.format(date);

    weekDays.insert(0, formatted.substring(0, 1));
  }
  return weekDays;
}

class BarChartWidget extends HookWidget {
  const BarChartWidget({super.key, required this.weeklySpendingPomodoro});
  final List<double> weeklySpendingPomodoro;

  @override
  Widget build(BuildContext context) {
    final touchedIndex = useState(-1);
    const Duration animDuration = Duration(milliseconds: 250);
    final xDayNamesList = createListOfWeekDaySingleCharTitle();

    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: <Widget>[
          Column(
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
                          tooltipBgColor:
                              Theme.of(context).colorScheme.secondary,
                          tooltipHorizontalAlignment:
                              FLHorizontalAlignment.right,
                          tooltipMargin: 20,
                          fitInsideVertically: true,
                          fitInsideHorizontally: true,
                          getTooltipItem: (group, groupIndex, rod, rodIndex) =>
                              BarTooltipItem(
                            "Today pomodoros\n",
                            Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                            children: <TextSpan>[
                              TextSpan(
                                text: (rod.toY - 1).toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        touchCallback: (FlTouchEvent event, barTouchResponse) {
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
                          weeklySpendingPomodoro.length,
                          (i) => makeGroupData(
                                context,
                                x: i,
                                y: weeklySpendingPomodoro[i],
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
