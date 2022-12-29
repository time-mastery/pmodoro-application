import 'package:pomodore/core/utils/database_helper.dart';
import 'package:pomodore/features/task_management/data/models/category_model.dart';
import 'package:pomodore/features/task_management/data/models/pomodoro_model.dart';
import 'package:pomodore/features/task_management/domain/entities/category_entity.dart';
import 'package:pomodore/features/task_management/domain/entities/pomodoro_entity.dart';
import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';
import 'package:sqflite/sqflite.dart';

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
      // todo : check here to optimize query we can change it to [getSpecificDate]
      List<Map<String, Object?>> records =
          await db.rawQuery('SELECT * FROM ${DatabaseHelper.taskTable}');

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

  getTaskById(String id) {}

  getCompletedTask() {}
}
