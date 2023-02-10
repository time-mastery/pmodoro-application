import 'package:equatable/equatable.dart';

class AnalysisEntity extends Equatable {
  final Map<DateTime, int> overviews;
  final List<YearlyAnalyzeItemEntity> yearlyAnalyze;
  final int todayCompletedPomodoroCount, todayCompletedTask;

  const AnalysisEntity({
    required this.overviews,
    required this.yearlyAnalyze,
    required this.todayCompletedPomodoroCount,
    required this.todayCompletedTask,
  });

  @override
  List<Object?> get props => [
        yearlyAnalyze,
        overviews,
        todayCompletedPomodoroCount,
        todayCompletedTask,
      ];
}

class YearlyAnalyzeItemEntity extends Equatable {
  final String month;
  final int count;

  const YearlyAnalyzeItemEntity({required this.month, required this.count});

  @override
  List<Object?> get props => [month, count];
}
