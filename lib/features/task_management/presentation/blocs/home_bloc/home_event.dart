part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeDataFetched extends HomeEvent {
  final DateTime date;

  const HomeDataFetched(this.date);

  @override
  List<Object?> get props => [date];

  @override
  String toString() {
    return 'HomeDataFetched{date: $date}';
  }
}

class DailyGoalChecked extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class DailyGoalSaved extends HomeEvent {
  final int count;

  const DailyGoalSaved(this.count);

  @override
  List<Object?> get props => [count];
}
