part of 'analysis_bloc.dart';

abstract class AnalysisState extends Equatable {
  const AnalysisState();
}

class AnalysisInitial extends AnalysisState {
  @override
  List<Object> get props => [];
}

class FetchAnalysisLoading extends AnalysisState {
  @override
  List<Object?> get props => [];
}

class FetchAnalysisSuccess extends AnalysisState {
  final AnalysisEntity item;

  const FetchAnalysisSuccess(this.item);

  @override
  List<Object?> get props => [item];
}

class FetchAnalysisFailure extends AnalysisState {
  @override
  List<Object?> get props => [];
}
