part of "analysis_bloc.dart";

abstract class AnalysisEvent extends Equatable {
  const AnalysisEvent();
}

class AnalysisFetched extends AnalysisEvent {
  @override
  List<Object?> get props => [];
}
