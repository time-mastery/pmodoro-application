import 'package:equatable/equatable.dart';

class AnalyzeEntity extends Equatable {
  final List<ActivityOverviewCountItemEntity> overviews;

  final List<YearlyAnalyzeItemEntity> yearlyAnalyze;

  final int todayPomodoroCount;

  const AnalyzeEntity({
    required this.overviews,
    required this.yearlyAnalyze,
    required this.todayPomodoroCount,
  });

  @override
  List<Object?> get props => [yearlyAnalyze];
}

class ActivityOverviewCountItemEntity extends Equatable {
  final DateTime date;
  final int count;

  const ActivityOverviewCountItemEntity(
      {required this.date, required this.count});

  @override
  List<Object?> get props => [date, count];
}

class YearlyAnalyzeItemEntity extends Equatable {
  final DateTime month;
  final int count;

  const YearlyAnalyzeItemEntity({required this.month, required this.count});

  @override
  List<Object?> get props => [month, count];
}
