part of 'home_bloc.dart';

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
