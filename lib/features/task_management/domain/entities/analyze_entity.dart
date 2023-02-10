import 'package:equatable/equatable.dart';

class AnalyzeEntity extends Equatable {
  final List<ActivityOverviewCountItem> activities;
  final int todayPomodoroCount;

  const AnalyzeEntity({
    required this.activities,
    required this.todayPomodoroCount,
  });

  @override
  List<Object?> get props => [activities];
}

class ActivityOverviewCountItem extends Equatable {
  final DateTime date;
  final int count;

  const ActivityOverviewCountItem({required this.date, required this.count});

  @override
  List<Object?> get props => [date, count];
}

class TaskDetailsPieChart extends Equatable {
  final String typeTitle;
  final String count;

  const TaskDetailsPieChart({
    required this.typeTitle,
    required this.count,
  });

  @override
  List<Object?> get props => [count, typeTitle];
}

class YearlyAnalysisItemEntity extends Equatable {
  @override
  List<Object?> get props => [];
}
