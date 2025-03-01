import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pomodore/core/resources/params/task_params.dart";
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

@riverpod
class DailyGoal extends _$DailyGoal {
  @override
  FutureOr<int> build() async {
    final repo = ref.read(taskRepositoryProvider);
    return await repo.getDailyGoal();
  }

  Future<void> updateValue(int count) async {
    state = AsyncData(count);
  }
}

@riverpod
FutureOr<void> saveDailyGoal(Ref ref, int dailyGoal) async {
  final repo = ref.read(taskRepositoryProvider);
  await repo.saveDailyGoal(dailyGoal);
}

@riverpod
class TimerTask extends _$TimerTask {
  @override
  TaskModel? build() {
    return null;
  }

  void updateTask(TaskModel task) {
    state = task;
  }
}

@riverpod
class Tasks extends _$Tasks {
  @override
  FutureOr<List<TaskModel>> build() async {
    return ref.read(taskRepositoryProvider).getAllTasks();
  }
}

@riverpod
class AddTask extends _$AddTask {
  @override
  FutureOr<bool> build() async {
    return false;
  }

  Future<void> addTask(TaskParams params) async {
    state = const AsyncLoading();
    try {
      await ref.read(taskRepositoryProvider).addTask(params);
      state = const AsyncData(true);
      // Refresh the tasks list after adding a new task
      ref.invalidate(tasksProvider);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }
}

@riverpod
class EditTask extends _$EditTask {
  @override
  FutureOr<bool> build() async {
    return false;
  }

  Future<void> editTask(TaskParams params) async {
    state = const AsyncLoading();
    try {
      await ref.read(taskRepositoryProvider).editTask(params);
      state = const AsyncData(true);
      // Refresh the tasks list after editing a task
      ref.invalidate(tasksProvider);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }
}

@riverpod
class DeleteTask extends _$DeleteTask {
  @override
  FutureOr<bool> build() async {
    return false;
  }

  Future<void> deleteTask(int taskId) async {
    state = const AsyncLoading();
    try {
      await ref.read(taskRepositoryProvider).deleteTask(taskId);
      state = const AsyncData(true);
      // Refresh the tasks list after deleting a task
      ref.invalidate(tasksProvider);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    }
  }
}
