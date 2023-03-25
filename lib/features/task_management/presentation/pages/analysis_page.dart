import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";
import "package:pomodore/core/shared_widgets/global_indicator.dart";
import "package:pomodore/core/utils/debug_print.dart";
import "package:pomodore/core/utils/responsive/size_config.dart";
import "package:pomodore/features/task_management/presentation/blocs/analysis_bloc/analysis_bloc.dart";
import "package:pomodore/features/task_management/presentation/pages/analysis_widgets/bar_chart_widget.dart";
import "package:pomodore/features/task_management/presentation/shared_widgets/detail_richtext_widget.dart";
import "package:syncfusion_flutter_charts/charts.dart";

import "../../../../core/shared_widgets/base_app_bar.dart";
import "../../../../di.dart";
import "../../../../exports.dart";
import "../../domain/entities/analysis_entity.dart";

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({Key? key}) : super(key: key);

  static const routeName = "/analyze";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<AnalysisBloc>()..add(AnalysisFetched()),
      child: const AnalysisView(),
    );
  }
}

class AnalysisView extends StatelessWidget {
  const AnalysisView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: BlocBuilder<AnalysisBloc, AnalysisState>(
          builder: (context, state) {
            AnalysisEntity? item;

            if (state is FetchAnalysisLoading ||
                state is FetchAnalysisFailure) {
              return const GlobalIndicator();
            }

            if (state is FetchAnalysisSuccess) {
              dPrint(state.item.toString());
              item = state.item;
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    20.spaceH(),
                    BarChartWidget(),
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
                              count: item?.todayCompletedPomodoroCount
                                      .toString() ??
                                  "0",
                              title: localization.todayPmodoreTitle,
                            ),
                            DetailRichTextWidget(
                              count: item?.todayCompletedTask.toString() ?? "0",
                              title: localization.todayCompletedTask,
                            ),
                          ],
                        ),
                      ),
                    ),
                    (SizeConfig.heightMultiplier * 1.5).spaceH(),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(),
                              title: ChartTitle(
                                text: localization.yearAnalysisTitle,
                                textStyle:
                                    Theme.of(context).textTheme.titleLarge,
                              ),
                              tooltipBehavior: TooltipBehavior(enable: true),
                              enableAxisAnimation: true,
                              series: <
                                  LineSeries<YearlyAnalyzeItemEntity, String>>[
                                LineSeries<YearlyAnalyzeItemEntity, String>(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  width: 5,
                                  dataSource: item?.yearlyAnalyze ?? [],
                                  xValueMapper:
                                      (YearlyAnalyzeItemEntity sales, _) =>
                                          sales.month,
                                  yValueMapper:
                                      (YearlyAnalyzeItemEntity sales, _) =>
                                          sales.count,
                                  dataLabelSettings:
                                      const DataLabelSettings(isVisible: true),
                                )
                              ]),
                        ),
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
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: HeatMap(
                                size: 22,
                                scrollable: true,
                                fontSize: 9,
                                showText: true,
                                defaultColor:
                                    Theme.of(context).colorScheme.brightness ==
                                            Brightness.dark
                                        ? Theme.of(context)
                                            .colorScheme
                                            .onBackground
                                            .withOpacity(.1)
                                        : null,
                                colorMode: ColorMode.opacity,
                                datasets: item?.overviews,
                                showColorTip: true,
                                colorsets: {
                                  1: Theme.of(context).colorScheme.secondary
                                },
                                colorTipCount: 10,
                                colorTipHelper: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      localization.lessTitle,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      localization.moreTitle,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                ],
                                onClick: (value) {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
