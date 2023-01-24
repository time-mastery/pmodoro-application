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

class TaskTimerStarted extends HomeEvent {
  @override
  List<Object?> get props => [];
}
