import 'package:pomodore/core/utils/database_helper.dart';
import 'package:pomodore/features/task_management/data/models/category_model.dart';
import 'package:pomodore/features/task_management/domain/entities/category_entity.dart';
import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';
import 'package:sqflite/sqflite.dart';

import '../models/task_model.dart';

class LocalDataSource {
  final Database db;

  LocalDataSource(this.db);

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
    } catch (e, s) {
      return false;
    }
    return true;
  }

  getTaskById(String id) {}

  deleteTask(String id) {}

  getTaskByDate(DateTime date) {}

  getCompletedTask() {}
}
