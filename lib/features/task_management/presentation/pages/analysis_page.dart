import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:pomodore/core/constant/constant.dart';
import 'package:pomodore/core/shared_widgets/global_indicator.dart';
import 'package:pomodore/core/utils/debug_print.dart';
import 'package:pomodore/core/utils/size_config.dart';
import 'package:pomodore/features/task_management/presentation/blocs/analysis_bloc/analysis_bloc.dart';
import 'package:pomodore/features/task_management/presentation/widgets/detail_richtext_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/shared_widgets/base_app_bar.dart';
import '../../../../di.dart';
import '../../../../exports.dart';
import '../../domain/entities/analysis_entity.dart';

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
    AppLocalizations localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: BaseAppBar(
        title: localization.analysisPageTitle,
        hasBackBtn: true,
      ),
      body: BlocBuilder<AnalysisBloc, AnalysisState>(
        builder: (context, state) {
          AnalysisEntity? item;

          if (state is FetchAnalysisLoading || state is FetchAnalysisFailure) {
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
                  Center(
                    child: Container(
                      width: SizeConfig.widthMultiplier * 90,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppConstant.primaryColor.withOpacity(.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          DetailRichTextWidget(
                            count:
                                item?.todayCompletedPomodoroCount.toString() ??
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
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1.5,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppConstant.primaryColor.withOpacity(.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: SfCartesianChart(
                            primaryXAxis: CategoryAxis(),
                            title: ChartTitle(
                              text: localization.yearAnalysisTitle,
                              textStyle: Theme.of(context).textTheme.titleLarge,
                            ),
                            tooltipBehavior: TooltipBehavior(enable: true),
                            enableAxisAnimation: true,
                            series: <
                                LineSeries<YearlyAnalyzeItemEntity, String>>[
                              LineSeries<YearlyAnalyzeItemEntity, String>(
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
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1.5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppConstant.primaryColor.withOpacity(.1),
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
                              textColor: AppConstant.textColor,
                              size: 22,
                              scrollable: true,
                              fontSize: 9,
                              showText: false,
                              defaultColor:
                                  AppConstant.textColor.withOpacity(.1),
                              colorMode: ColorMode.opacity,
                              datasets: item?.overviews,
                              showColorTip: true,
                              colorsets: const {1: AppConstant.primaryColor},
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
    );
  }
}
