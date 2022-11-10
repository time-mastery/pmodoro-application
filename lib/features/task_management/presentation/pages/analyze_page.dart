import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:pomodore/core/constant/constant.dart';
import 'package:pomodore/core/utils/size_config.dart';
import 'package:pomodore/features/task_management/presentation/widgets/detail_richtext_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/shared_widgets/base_app_bar.dart';
import '../../../../exports.dart';

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

class AnalyzePage extends StatelessWidget {
  const AnalyzePage({Key? key}) : super(key: key);

  static const routeName = "/analyze";

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;

    List<_ChartData> data = [
      _ChartData('David', 25),
      _ChartData('Steve', 38),
      _ChartData('Jack', 34),
      _ChartData('Others', 52)
    ];

    return Scaffold(
      appBar: BaseAppBar(
        title: localization.analysisPageTitle,
        hasBackBtn: true,
      ),
      body: SingleChildScrollView(
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
                        changes: "1",
                        count: "2",
                        title: localization.todayPmodoreTitle,
                      ),
                      DetailRichTextWidget(
                        changes: "2",
                        count: "10",
                        title: localization.todayFocusTitle,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppConstant.primaryColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SfCircularChart(
                    title: ChartTitle(
                      text: localization.taskDetailTitle,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                    ),
                    enableMultiSelection: true,
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <CircularSeries<_ChartData, String>>[
                      DoughnutSeries<_ChartData, String>(
                          dataSource: data,
                          xValueMapper: (_ChartData data, _) => data.x,
                          yValueMapper: (_ChartData data, _) => data.y,
                          name: 'Gold')
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppConstant.primaryColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      title: ChartTitle(
                        text: localization.yearAnalysisTitle,
                        textStyle: Theme.of(context).textTheme.titleLarge,
                      ),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <LineSeries<SalesData, String>>[
                        LineSeries<SalesData, String>(
                          // todo : generate data for here
                          dataSource: <SalesData>[
                            SalesData('Jan', 35),
                            SalesData('Feb', 28),
                            SalesData('Mar', 34),
                            SalesData('Apr', 32),
                            SalesData('May', 40)
                          ],
                          xValueMapper: (SalesData sales, _) => sales.year,
                          yValueMapper: (SalesData sales, _) => sales.sales,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: true),
                        )
                      ]),
                ),
              ),
              const SizedBox(
                height: 10,
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
                      ),
                    ),
                    HeatMap(
                      textColor: AppConstant.textColor,
                      size: 22,
                      scrollable: true,
                      fontSize: 9,
                      showText: true,
                      defaultColor: AppConstant.textColor.withOpacity(.1),
                      colorMode: ColorMode.opacity,
                      // todo : create a data sets from tasks
                      datasets: {
                        DateTime.now(): 3,
                        DateTime(2022, 10, 7): 7,
                        DateTime(2022, 10, 8): 10,
                        DateTime(2022, 10, 9): 13,
                        DateTime(2022, 10, 13): 6,
                      },
                      showColorTip: false,
                      colorsets: const {1: AppConstant.swatchColor},
                      onClick: (value) {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
