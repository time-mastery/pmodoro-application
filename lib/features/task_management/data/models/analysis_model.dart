import "package:pomodore/features/task_management/data/models/pomodoro_model.dart";
import "package:pomodore/features/task_management/domain/entities/analysis_entity.dart";

import "package:pomodore/core/utils/utils.dart";

class AnalysisModel extends AnalysisEntity {
  const AnalysisModel({
    required super.overviews,
    required super.yearlyAnalyze,
    required int todayPomodoroCount,
    required super.todayCompletedTask,
    required super.weeklySpendingPomodoro,
  }) : super(
          todayCompletedPomodoroCount: todayPomodoroCount,
        );

  factory AnalysisModel.fromJson(Map<String, dynamic> item) {
    final List<YearlyAnalyzeItemModel> yearlyAnalyze = createYearlyAnalysis(item["yearlyAnalyze"]);
    final Map<DateTime, int> overviews = createOverview(item["overviews"]);

    return AnalysisModel(
      overviews: overviews,
      yearlyAnalyze: yearlyAnalyze,
      todayPomodoroCount: item["todayPomodoroCount"],
      todayCompletedTask: item["todayCompletedTask"],
      weeklySpendingPomodoro: item["weeklySpendingPomodoro"],
    );
  }

  static Map<DateTime, int> createOverview(List<PomodoroModel> mapList) {
    final Map<DateTime, int> overviews = {};
    for (var element in mapList) {
      final DateTime dateTime = Utils.createOverviewItemDateTime(element.dateTime);
      if (overviews.containsKey(dateTime)) {
        overviews.update(dateTime, (value) => value + 1);
      } else {
        overviews[dateTime] = 1;
      }
    }

    return overviews;
  }

  static List<YearlyAnalyzeItemModel> createYearlyAnalysis(List<PomodoroModel>? mapList) {
    final Map<String, int> yearMap = {};
    if (mapList == null) return [];
    for (var element in mapList) {
      final String monthName = Utils.monthNameOfDateTime(element.dateTime);
      if (yearMap.containsKey(monthName)) {
        yearMap.update(monthName, (value) => value + 1);
      } else {
        yearMap[monthName] = 1;
      }
    }

    final List<YearlyAnalyzeItemModel> yearlyAnalyze =
        yearMap.entries.map((e) => YearlyAnalyzeItemModel(month: e.key, count: e.value)).toList();

    return yearlyAnalyze;
  }
}

class YearlyAnalyzeItemModel extends YearlyAnalyzeItemEntity {
  const YearlyAnalyzeItemModel({
    required super.month,
    required super.count,
  });

  factory YearlyAnalyzeItemModel.fromJson(Map<String, dynamic> item) => YearlyAnalyzeItemModel(
        month: item["dateTime"],
        count: item["count"],
      );
}
