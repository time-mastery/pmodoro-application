import "dart:developer";

import "package:dartz/dartz.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pomodore/core/resources/params/task_params.dart";
import "package:pomodore/features/task_management/data_sources/tasks_local_data_source.dart";
import "package:pomodore/features/task_management/models/analysis_model.dart";
import "package:pomodore/features/task_management/models/daily_information_model.dart";
import "package:pomodore/features/task_management/models/pomodoro_model.dart";
import "package:pomodore/features/task_management/models/task_model.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part "task_repository.g.dart";

@riverpod
TaskRepository taskRepository(Ref ref) {
  return TaskRepositoryImpl(ref.read(tasksLocalDataSourceProvider));
}

abstract class TaskRepository {
  Future<bool> addTask(TaskParams task);

  Future<List<TaskModel>> getTaskByDate(DateTime date);

  Future<List<TaskModel>> getUnCompletedTasks();

  Future<List<TaskModel>> getAllTasks();

  Future<List<PomodoroModel>> getAllTodayPomodoro();

  Future<DailyInformationModel> getDailyInformation();

  Future<AnalysisModel> getAnalysis();

  Future<bool> checkDailyGoal();

  Future<bool> saveDailyGoal(int count);

  Future<String> completeTask(TaskParams params);

  Future<String> editTask(TaskParams task);

  Future<String> deleteTask(int taskId);
}

class TaskRepositoryImpl implements TaskRepository {
  final TasksLocalDataSource localDataSource;

  TaskRepositoryImpl(this.localDataSource);

  @override
  Future<bool> addTask(TaskParams task) async {
    try {
      final TaskModel? state = await localDataSource.addTask(task);
      return state != null;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<List<TaskModel>> getTaskByDate(DateTime date) async {
    try {
      final List<TaskModel>? rawList =
          await localDataSource.getSpecificDateTasks(date);
      return rawList ?? [];
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<List<TaskModel>> getAllTasks() async {
    try {
      final List<TaskModel>? rawList = await localDataSource.getAllTasks();
      return rawList ?? [];
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<List<TaskModel>> getUnCompletedTasks() async {
    try {
      final List<TaskModel>? rawList =
          await localDataSource.getAllUnCompletedTasks();
      return rawList ?? [];
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<List<PomodoroModel>> getAllTodayPomodoro() async {
    try {
      final List<PomodoroModel>? rawList =
          await localDataSource.getAllTodayPomodoroFromDb();
      return rawList ?? [];
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<DailyInformationModel> getDailyInformation() async {
    try {
      final int completedTasksQuantity =
          await localDataSource.getCompletedTaskQuantity();
      final int tasksQuantity = await localDataSource.getAllTodayTaskQuantity();
      final int dailyGoal = await localDataSource.getDailyGoalQuantity() ?? 1;
      double processPercentage = 0;

      if (tasksQuantity == 0) {
        processPercentage = 0;
      } else if (dailyGoal < completedTasksQuantity) {
        processPercentage = 1;
      } else {
        processPercentage = double.parse(
            (completedTasksQuantity / dailyGoal).toStringAsFixed(1));
      }

      return DailyInformationModel(
        dailyGoalQuantity: dailyGoal,
        taskQuantity: tasksQuantity,
        completedTaskQuantity: completedTasksQuantity,
        processPercentage: processPercentage,
      );
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<AnalysisModel> getAnalysis() async {
    try {
      final Map<String, dynamic>? rawData =
          await localDataSource.getAnalysisPageData();
      if (rawData != null) {
        return AnalysisModel.fromJson(rawData);
      } else {
        throw Exception("Error fetching analysis data");
      }
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<bool> checkDailyGoal() async {
    try {
      final bool? rawData = await localDataSource.checkDailyGoal();
      return rawData ?? false;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<bool> saveDailyGoal(int count) async {
    try {
      final bool rawData = await localDataSource.saveDailyGoal(count);
      return rawData;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<String> deleteTask(int id) async {
    try {
      int? status = await localDataSource.deleteTask(id);
      return status != null ? status.toString() : "error";
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<String> completeTask(TaskParams params) async {
    try {
      final TaskModel? status = await localDataSource.completeTask(params);
      return status != null ? status.uid : "error";
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<String> editTask(TaskParams task) async {
    try {
      final TaskModel? status = await localDataSource.editTask(task);
      return status != null ? status.uid : "error";
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      rethrow;
    }
  }
}
