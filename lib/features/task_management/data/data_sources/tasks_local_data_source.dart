import 'package:flutter/foundation.dart';
import 'package:pomodore/core/utils/database_helper.dart';
import 'package:pomodore/core/utils/debug_print.dart';
import 'package:pomodore/features/task_management/data/models/category_model.dart';
import 'package:pomodore/features/task_management/data/models/pomodoro_model.dart';
import 'package:pomodore/features/task_management/domain/entities/category_entity.dart';
import 'package:pomodore/features/task_management/domain/entities/pomodoro_entity.dart';
import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/utils/utils.dart';
import '../models/task_model.dart';

class TasksLocalDataSource {
  final Database db;

  TasksLocalDataSource(this.db);

  Future<bool> addTask(TaskEntity task) async {
    try {
      Map<String, Object?> data = TaskModel.toDbQuery(task);
      await db.insert(DatabaseHelper.taskTable, data);
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> addCategory(CategoryEntity category) async {
    try {
      Map<String, Object?> data = CategoryModel.toDbQuery(category);
      await db.insert(DatabaseHelper.categoryTable, data);
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<List<Map<String, dynamic>>>? getAllTasks() async {
    List<Map<String, dynamic>>? list;
    try {
      List<Map<String, Object?>> records =
          await db.rawQuery('SELECT * FROM ${DatabaseHelper.taskTable}');

      list = records;
    } catch (e) {
      rethrow;
    }

    return list;
  }

  Future<List<Map<String, dynamic>>>? getSpecificDateTasks(
      DateTime time) async {
    List<Map<String, dynamic>>? list;
    try {
      List<Map<String, Object?>> records = await db.rawQuery(
          'SELECT * FROM ${DatabaseHelper.taskTable} WHERE deadLineTime >= '
          '${Utils.formatDateToYYYYMMDD(time)} ');

      list = records;
    } catch (e) {
      rethrow;
    }

    return list;
  }

  Future<List<Map<String, dynamic>>>? getAllCategories() async {
    List<Map<String, dynamic>>? list;
    try {
      List<Map<String, Object?>> records =
          await db.rawQuery('SELECT * FROM ${DatabaseHelper.categoryTable}');

      list = records;
    } catch (e) {
      rethrow;
    }

    return list;
  }

  Future<int?> completeTask(TaskEntity task) async {
    int? result;
    try {
      result = await db.update(
        DatabaseHelper.taskTable,
        TaskModel.toDbQuery(task),
        where: "uid = ?",
        whereArgs: [task.id],
      );
    } catch (e) {
      rethrow;
    }

    return result;
  }

  Future<int?> deleteTask(String id) async {
    int? result;
    try {
      result = await db.delete(
        DatabaseHelper.taskTable,
        where: "uid = ?",
        whereArgs: [id],
      );
    } catch (e) {
      rethrow;
    }

    return result;
  }

  Future<bool> saveAPomodoroOnDb(PomodoroEntity item) async {
    try {
      Map<String, Object?> data = PomodoroModel.toDbQuery(item);
      await db.insert(DatabaseHelper.pomodoroTable, data);
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<List<Map<String, dynamic>>>? getAllPomodoroFromDb() async {
    List<Map<String, dynamic>>? list;
    try {
      List<Map<String, Object?>> records =
          await db.rawQuery('SELECT * FROM ${DatabaseHelper.pomodoroTable}');

      list = records;
    } catch (e) {
      rethrow;
    }

    return list;
  }

  Future<List<Map<String, dynamic>>>? getAllTodayPomodoroFromDb(
      DateTime time) async {
    List<Map<String, dynamic>>? list;
    try {
      // todo : fix query
      List<Map<String, Object?>> records = await db.rawQuery(
          'SELECT * FROM ${DatabaseHelper.pomodoroTable} where datetime >= ${Utils.formatDateToYYYYMMDD(time)}');

      list = records;
    } catch (e) {
      rethrow;
    }

    return list;
  }

  Future<int> getAllTodayTaskQuantity() async {
    late int quantity;

    try {
      List<Map<String, dynamic>>? tasks =
          await getSpecificDateTasks(DateTime.now());

      quantity = tasks == null ? 0 : tasks.length;
    } catch (e) {
      rethrow;
    }
    return quantity;
  }

  Future<int> getCompletedTaskQuantity() async {
    late int quantity;

    try {
      List<Map<String, Object?>> records = await db.query(
        DatabaseHelper.taskTable,
        columns: ["_id"],
        where: "done = ?",
        whereArgs: [1],
      );

      quantity = records.length;
    } catch (e) {
      rethrow;
    }
    return quantity;
  }

  Future<Map<String, dynamic>> getAnalysisPageData() async {
    late Map<String, dynamic> item;
    try {
      int todayCompletedTask = await getCompletedTaskQuantity();
      List<Map<String, dynamic>>? todayPomodoroList =
          await getAllTodayPomodoroFromDb(DateTime.now());
      int todayPomodoroCount = todayPomodoroList?.length ?? 0;

      item = {
        "overviews": todayPomodoroList,
        "yearlyAnalyze": todayPomodoroList,
        "todayPomodoroCount": todayPomodoroCount,
        "todayCompletedTask": todayCompletedTask,
      };
    } catch (e, s) {
      dPrint("$e $s");
    }

    return item;
  }

  getTaskById(String id) {}

  getCompletedTask() {}
}
