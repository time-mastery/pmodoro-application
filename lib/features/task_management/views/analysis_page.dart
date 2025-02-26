import "package:flutter/material.dart";
import "package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";
import "package:pomodore/core/shared_widgets/base_app_bar.dart";
import "package:pomodore/core/shared_widgets/global_indicator.dart";
import "package:pomodore/core/utils/responsive/size_config.dart";
import "package:pomodore/exports.dart";
import "package:pomodore/features/task_management/models/analysis_model.dart";
import "package:pomodore/features/task_management/providers/task_management_providers.dart";
import "package:pomodore/features/task_management/views/analysis_widgets/bar_chart_widget.dart";
import "package:pomodore/features/task_management/views/shared/detail_richtext_widget.dart";
import "package:syncfusion_flutter_charts/charts.dart";

class AnalysisPage extends ConsumerWidget {
  const AnalysisPage({super.key});

  static const routeName = "/analyze";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncItem = ref.watch(analysisProvider);
    final AppLocalizations localization = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: BaseAppBar(
        title: localization.analysisPageTitle,
        hasBackBtn: true,
        customColor: Theme.of(context).colorScheme.onSecondary,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 35,
              ),
              child: asyncItem.when(
                data: (item) {
                  return Column(
                    children: [
                      20.spaceH(),
                      Center(
                        child: Container(
                          width: SizeConfig.widthMultiplier * 90,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              DetailRichTextWidget(
                                count: item.todayPomodoroCount.toString(),
                                title: localization.todayPmodoreTitle,
                              ),
                              DetailRichTextWidget(
                                count: item.todayCompletedTask.toString(),
                                title: localization.todayCompletedTask,
                              ),
                            ],
                          ),
                        ),
                      ),
                      20.spaceH(),
                      BarChartWidget(
                          weeklySpendingPomodoro: item.weeklySpendingPomodoro),
                      (SizeConfig.heightMultiplier * 1.5).spaceH(),
                      Center(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  localization.yearAnalysisTitle,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                            20.spaceH(),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: SfCartesianChart(
                                    primaryXAxis: const CategoryAxis(),
                                    tooltipBehavior:
                                        TooltipBehavior(enable: true),
                                    enableAxisAnimation: true,
                                    series: <LineSeries<YearlyAnalyzeItemModel,
                                        String>>[
                                      LineSeries<YearlyAnalyzeItemModel,
                                          String>(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        width: 5,
                                        dataSource: item.yearlyAnalyze,
                                        xValueMapper:
                                            (YearlyAnalyzeItemModel sales, _) =>
                                                sales.month,
                                        yValueMapper:
                                            (YearlyAnalyzeItemModel sales, _) =>
                                                sales.count,
                                        dataLabelSettings:
                                            const DataLabelSettings(
                                                isVisible: true),
                                      )
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      (SizeConfig.heightMultiplier * 1.5).spaceH(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                localization.dailyActivityTitle,
                                style: Theme.of(context).textTheme.titleLarge,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: HeatMap(
                                  textColor:
                                      Theme.of(context).colorScheme.onSurface,
                                  size: 22,
                                  scrollable: true,
                                  fontSize: 9,
                                  showText: true,
                                  defaultColor: Theme.of(context)
                                              .colorScheme
                                              .brightness ==
                                          Brightness.dark
                                      ? Theme.of(context)
                                          .colorScheme
                                          .onSurface
                                          .withAlpha(10)
                                      : null,
                                  colorMode: ColorMode.opacity,
                                  datasets: item.overviews,
                                  showColorTip: false,
                                  colorsets: {
                                    1: Theme.of(context).colorScheme.secondary
                                  },
                                  onClick: (value) {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                // TODO: Add error handling
                error: (error, _) => Center(child: Text(error.toString())),
                loading: () => const GlobalIndicator(),
              )),
        ),
      ),
    );
  }
}
