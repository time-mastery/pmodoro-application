import 'package:pomodore/features/task_management/domain/entities/analysis_entity.dart';

class AnalysisModel extends AnalysisEntity {
  const AnalysisModel({
    required List<ActivityOverviewCountItemEntity> overviews,
    required List<YearlyAnalyzeItemEntity> yearlyAnalyze,
    required int todayPomodoroCount,
  }) : super(
          yearlyAnalyze: yearlyAnalyze,
          todayPomodoroCount: todayPomodoroCount,
          overviews: overviews,
        );

  factory AnalysisModel.fromJson(Map<String, dynamic> item) {
    List<ActivityOverviewCountItemEntity> overviews = [];
    List<YearlyAnalyzeItemEntity> yearlyAnalyze = [];

    for (var element in (item["overviews"] as List)) {
      overviews.add(ActivityOverviewCountItemModel.fromJson(element));
    }

    for (var element in (item["yearlyAnalyze"] as List)) {
      yearlyAnalyze.add(YearlyAnalyzeItemModel.fromJson(element));
    }

    return AnalysisModel(
      overviews: overviews,
      yearlyAnalyze: yearlyAnalyze,
      todayPomodoroCount: item["todayPomodoroCount"],
    );
  }
}

class ActivityOverviewCountItemModel extends ActivityOverviewCountItemEntity {
  const ActivityOverviewCountItemModel({
    required DateTime date,
    required int count,
  }) : super(count: count, date: date);

  factory ActivityOverviewCountItemModel.fromJson(Map<String, dynamic> item) =>
      ActivityOverviewCountItemModel(
        date: item["date"],
        count: item["count"],
      );
}

class YearlyAnalyzeItemModel extends YearlyAnalyzeItemEntity {
  const YearlyAnalyzeItemModel({
    required DateTime month,
    required int count,
  }) : super(
          count: count,
          month: month,
        );

  factory YearlyAnalyzeItemModel.fromJson(Map<String, dynamic> item) =>
      YearlyAnalyzeItemModel(
        month: item["month"],
        count: item["count"],
      );
}
