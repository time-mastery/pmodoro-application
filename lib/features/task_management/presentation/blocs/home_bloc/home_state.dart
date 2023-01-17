part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class FetchTodayTasksLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class FetchTodayTasksSuccess extends HomeState {
  final List<TaskEntity> list;

  const FetchTodayTasksSuccess(this.list);

  @override
  List<Object?> get props => [list];
}

class FetchTodayTasksFail extends HomeState {
  @override
  List<Object?> get props => [];
}

class FetchDailyInformationLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class FetchDailyInformationSuccess extends HomeState {
  final DailyInformationEntity item;

  const FetchDailyInformationSuccess(this.item);

  @override
  List<Object?> get props => [item];
}

class FetchDailyInformationFail extends HomeState {
  @override
  List<Object?> get props => [];
}
