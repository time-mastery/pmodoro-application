import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pomodore/features/task_management/models/analysis_model.dart";
import "package:pomodore/features/task_management/models/daily_information_model.dart";
import "package:pomodore/features/task_management/models/task_model.dart";
import "package:pomodore/features/task_management/repositories/task_repository.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part "task_management_providers.g.dart";

@riverpod
class Analysis extends _$Analysis {
  @override
  FutureOr<AnalysisModel> build() {
    final repo = ref.read(taskRepositoryProvider);
    return repo.getAnalysis();
  }
}

@riverpod
class Home extends _$Home {
  @override
  FutureOr<DailyInformationModel> build() async {
    final repo = ref.read(taskRepositoryProvider);
    return repo.getDailyInformation();
  }
}

@riverpod
FutureOr<List<TaskModel>> uncompletedTasks(Ref ref) {
  final repo = ref.read(taskRepositoryProvider);
  return repo.getUnCompletedTasks();
}
