part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class TodayTasksFetched extends HomeEvent {
  final DateTime date;

  const TodayTasksFetched(this.date);

  @override
  List<Object?> get props => [date];
}

class DailyInformationFetched extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class TaskTimerStarted extends HomeEvent {
  @override
  List<Object?> get props => [];
}
