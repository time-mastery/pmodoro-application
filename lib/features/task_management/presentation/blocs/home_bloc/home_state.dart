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
  @override
  List<Object?> get props => [];
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
  @override
  List<Object?> get props => [];
}

class FetchDailyInformationFail extends HomeState {
  @override
  List<Object?> get props => [];
}
