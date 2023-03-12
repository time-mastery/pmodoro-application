part of "home_bloc.dart";

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class FetchHomeDataSuccess extends HomeState {
  final List<TaskEntity> list;
  final DailyInformationEntity item;

  const FetchHomeDataSuccess(this.list, this.item);

  @override
  List<Object?> get props => [list, item];
}

class FetchHomeDataLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class FetchHomeDataFail extends HomeState {
  @override
  List<Object?> get props => [];
}

class CheckDailyGoalLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class CheckDailyGoalSuccess extends HomeState {
  final bool dailyGoalSubmitted;

  const CheckDailyGoalSuccess(this.dailyGoalSubmitted);

  @override
  List<Object?> get props => [dailyGoalSubmitted];
}

class CheckDailyGoalFailure extends HomeState {
  @override
  List<Object?> get props => [];
}

class SaveDailyGoalLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class SaveDailyGoalSuccess extends HomeState {
  @override
  List<Object?> get props => [];
}

class SaveDailyGoalFailure extends HomeState {
  @override
  List<Object?> get props => [];
}

class UpdateDailyGoalSuccess extends HomeState {
  final int value;

  const UpdateDailyGoalSuccess(this.value);

  @override
  List<Object?> get props => [value];
}

class UpdateDailyGoalLoading extends HomeState {
  @override
  List<Object?> get props => [];
}
