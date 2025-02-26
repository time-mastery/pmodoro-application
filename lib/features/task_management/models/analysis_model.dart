import "package:equatable/equatable.dart";
import "package:pomodore/features/task_management/models/pomodoro_model.dart";
import "package:pomodore/core/utils/utils.dart";

class AnalysisModel extends Equatable {
  final Map<DateTime, int> overviews;
  final List<YearlyAnalyzeItemModel> yearlyAnalyze;
  final int todayPomodoroCount;
  final int todayCompletedTask;
  final List<double> weeklySpendingPomodoro;

  const AnalysisModel({
    required this.overviews,
    required this.yearlyAnalyze,
    required this.todayPomodoroCount,
    required this.todayCompletedTask,
    required this.weeklySpendingPomodoro,
  });

  factory AnalysisModel.fromJson(Map<String, dynamic> item) {
    final List<YearlyAnalyzeItemModel> yearlyAnalyze =
        createYearlyAnalysis(item["yearlyAnalyze"]);
    final Map<DateTime, int> overviews = createOverview(item["overviews"]);

    return AnalysisModel(
      overviews: overviews,
      yearlyAnalyze: yearlyAnalyze,
      todayPomodoroCount: item["todayPomodoroCount"],
      todayCompletedTask: item["todayCompletedTask"],
      weeklySpendingPomodoro: List<double>.from(item["weeklySpendingPomodoro"]),
    );
  }

  static Map<DateTime, int> createOverview(List<PomodoroModel> mapList) {
    final Map<DateTime, int> overviews = {};
    for (var element in mapList) {
      final DateTime dateTime =
          Utils.createOverviewItemDateTime(element.dateTime);
      if (overviews.containsKey(dateTime)) {
        overviews.update(dateTime, (value) => value + 1);
      } else {
        overviews[dateTime] = 1;
      }
    }
    return overviews;
  }

  static List<YearlyAnalyzeItemModel> createYearlyAnalysis(
      List<PomodoroModel>? mapList) {
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
    return yearMap.entries
        .map((e) => YearlyAnalyzeItemModel(month: e.key, count: e.value))
        .toList();
  }

  @override
  List<Object?> get props => [
        overviews,
        yearlyAnalyze,
        todayPomodoroCount,
        todayCompletedTask,
        weeklySpendingPomodoro
      ];
}

class YearlyAnalyzeItemModel extends Equatable {
  final String month;
  final int count;

  const YearlyAnalyzeItemModel({
    required this.month,
    required this.count,
  });

  factory YearlyAnalyzeItemModel.fromJson(Map<String, dynamic> item) =>
      YearlyAnalyzeItemModel(
        month: item["dateTime"],
        count: item["count"],
      );

  @override
  List<Object?> get props => [month, count];
}
