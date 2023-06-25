import "package:pomodore/core/resources/params/task_params.dart";
import "package:pomodore/core/services/database/collections/pomodoro_collection.dart";
import "package:pomodore/core/services/database/collections/task_collection.dart";
import "package:pomodore/core/services/database/isar_helper.dart";
import "package:pomodore/core/utils/debug_print.dart";
import "package:pomodore/features/task_management/data/models/pomodoro_model.dart";

import "../models/task_model.dart";

class TasksLocalDataSource {
  final IsarHelper db;

  TasksLocalDataSource(this.db);

  Future<TaskModel?> addTask(TaskParams params) async {
    try {
      TaskCollection? task = await db.addTask(params);
      if (task == null) return null;
      return TaskModel.collectionToModel(task);
    } catch (e) {
      dPrint(e.toString());
      rethrow;
    }
  }

  Future<List<TaskModel>>? getAllUnCompletedTasks() async {
    try {
      final List<TaskCollection> tasks = await db.getUnCompletedTasks();

      return tasks.map((e) => TaskModel.collectionToModel(e)).toList();
    } catch (e, s) {
      dPrint(e.toString());
      dPrint(s.toString());
      rethrow;
    }
  }

  Future<List<TaskModel>>? getAllTasks() async {
    try {
      final List<TaskCollection> tasks = await db.getAllTasks();

      return tasks.map((e) => TaskModel.collectionToModel(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TaskModel>>? getSpecificDateTasks(DateTime time) async {
    try {
      final List<TaskCollection> tasks = await db.getSpecificDateTasks(time);

      return tasks.map((e) => TaskModel.collectionToModel(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<PomodoroModel>>? getAllPomodoroFromDb() async {
    try {
      final List<PomodoroCollection> records = await db.getAllPomodoros();

      return records
          .map((e) => PomodoroModel.pomodoroCollectionToModel(e))
          .toList();
    } catch (e) {
      dPrint(e.toString());
      rethrow;
    }
  }

  Future<List<PomodoroModel>>? getAllTodayPomodoroFromDb() async {
    try {
      final List<PomodoroCollection> records = await db.getAllTodayPomodoros();

      return records
          .map((e) => PomodoroModel.pomodoroCollectionToModel(e))
          .toList();
    } catch (e, s) {
      dPrint(e.toString());
      dPrint(s.toString());
      rethrow;
    }
  }

  Future<List<PomodoroModel>>? getSpecificDatePomodoro(DateTime date) async {
    try {
      final List<PomodoroCollection> records =
          await db.getSpecificDatePomodoros(date);

      return records
          .map((e) => PomodoroModel.pomodoroCollectionToModel(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<int> getAllTodayTaskQuantity() async {
    late int count;

    try {
      final int tasks = await db.getAllTodayTaskQuantity();

      count = tasks;
    } catch (e) {
      rethrow;
    }
    return count;
  }

  Future<int> getCompletedTaskQuantity() async {
    try {
      final int records = await db.getCompletedTaskQuantity();

      return records;
    } catch (e) {
      dPrint(e);
      rethrow;
    }
  }

  Future<List<double>?> getWeeklySpendingPomodoro() async {
    List<double>? list;
    try {
      final List<double> weeklySpendingPomodoro = [];
      for (int i = 0; i < 7; i++) {
        final DateTime date = DateTime.now().subtract(Duration(days: i));
        final List<PomodoroModel>? todayPomodoroList =
            await getSpecificDatePomodoro(date);
        final pomodoroCount = todayPomodoroList?.length ?? 0;
        weeklySpendingPomodoro.insert(0, pomodoroCount.toDouble());
      }

      dPrint("inja");
      dPrint(await getSpecificDatePomodoro(DateTime.now()));

      list = weeklySpendingPomodoro;
    } catch (e, s) {
      dPrint(e);
      dPrint(s);
      rethrow;
    }

    return list;
  }

  Future<Map<String, dynamic>?> getAnalysisPageData() async {
    late Map<String, dynamic>? item;
    try {
      final int todayCompletedTask = await getCompletedTaskQuantity();
      final List<PomodoroModel>? allPomodoroList = await getAllPomodoroFromDb();
      final List<PomodoroModel>? todayPomodoroList =
          await getAllTodayPomodoroFromDb();
      final int todayPomodoroCount = todayPomodoroList?.length ?? 0;
      final List<double>? weeklyList = await getWeeklySpendingPomodoro();

      item = {
        "overviews": allPomodoroList,
        "yearlyAnalyze": allPomodoroList,
        "todayPomodoroCount": todayPomodoroCount,
        "todayCompletedTask": todayCompletedTask,
        "weeklySpendingPomodoro": weeklyList ?? [],
      };
    } catch (e, s) {
      dPrint("$e $s");
      rethrow;
    }

    return item;
  }

  Future<bool> saveDailyGoal(int count) async {
    try {
      await db.saveDailyGoal(count);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<int?> getDailyGoalQuantity() async {
    try {
      final int? records = await db.getDailyGoalQuantity();

      return records;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool?> checkDailyGoal() async {
    try {
      final bool state = await db.checkDailyGoal();

      return state;
    } catch (e) {
      dPrint(e.toString());
      rethrow;
    }
  }

  Future<TaskModel?> editTask(TaskParams params) async {
    try {
      TaskCollection? task = await db.editTask(params);

      return TaskModel.collectionToModel(task!);
    } catch (e) {
      rethrow;
    }
  }

  Future<TaskModel?> completeTask(TaskParams params) async {
    try {
      TaskCollection? task = await db.editTask(params);

      return TaskModel.collectionToModel(task!);
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> deleteTask(int id) async {
    try {
      await db.deleteTask(id);
      return id;
    } catch (e) {
      return null;
    }
  }
}
