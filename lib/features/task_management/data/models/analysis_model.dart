import 'package:pomodore/features/task_management/domain/entities/analysis_entity.dart';

import '../../../../core/utils/utils.dart';

class AnalysisModel extends AnalysisEntity {
  const AnalysisModel({
    required Map<DateTime, int> overviews,
    required List<YearlyAnalyzeItemEntity> yearlyAnalyze,
    required int todayPomodoroCount,
    required int todayCompletedTask,
  }) : super(
          yearlyAnalyze: yearlyAnalyze,
          todayCompletedPomodoroCount: todayPomodoroCount,
          overviews: overviews,
          todayCompletedTask: todayCompletedTask,
        );

  factory AnalysisModel.fromJson(Map<String, dynamic> item) {
    List<YearlyAnalyzeItemModel> yearlyAnalyze =
        createYearlyAnalysis(item["yearlyAnalyze"]);
    Map<DateTime, int> overviews = createOverview(item["overviews"]);

    return AnalysisModel(
      overviews: overviews,
      yearlyAnalyze: yearlyAnalyze,
      todayPomodoroCount: item["todayPomodoroCount"],
      todayCompletedTask: item["todayCompletedTask"],
    );
  }

  static Map<DateTime, int> createOverview(List<Map<String, dynamic>> mapList) {
    Map<DateTime, int> overviews = {};
    for (var element in mapList) {
      DateTime dateTime = Utils.createOverviewItemDateTime(element["datetime"]);
      if (overviews.containsKey(dateTime)) {
        overviews.update(dateTime, (value) => value + 1);
      } else {
        overviews[dateTime] = 0;
      }
    }

    return overviews;
  }

  static List<YearlyAnalyzeItemModel> createYearlyAnalysis(
      List<Map<String, dynamic>> mapList) {
    Map<String, int> yearMap = {};
    for (var element in mapList) {
      String monthName = Utils.monthNameOfDateTime(element["datetime"]);
      if (yearMap.containsKey(monthName)) {
        yearMap.update(monthName, (value) => value + 1);
      } else {
        yearMap[monthName] = 0;
      }
    }

    List<YearlyAnalyzeItemModel> yearlyAnalyze = yearMap.entries
        .map((e) => YearlyAnalyzeItemModel(month: e.key, count: e.value))
        .toList();

    return yearlyAnalyze;
  }
}

class YearlyAnalyzeItemModel extends YearlyAnalyzeItemEntity {
  const YearlyAnalyzeItemModel({
    required String month,
    required int count,
  }) : super(
          count: count,
          month: month,
        );

  factory YearlyAnalyzeItemModel.fromJson(Map<String, dynamic> item) =>
      YearlyAnalyzeItemModel(
        month: item["dateTime"],
        count: item["count"],
      );
}
