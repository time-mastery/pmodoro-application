import 'package:pomodore/core/utils/debug_print.dart';
import 'package:pomodore/features/task_management/data/models/category_model.dart';
import 'package:pomodore/features/task_management/domain/entities/category_entity.dart';
import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';
import 'package:sqflite/sqflite.dart';
import '../../../../core/services/database/database_helper.dart';
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
      const query = 'SELECT * FROM ${DatabaseHelper.taskTable}';
      List<Map<String, Object?>> records = await db.rawQuery(query);

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
      const query = '''
      SELECT * FROM ${DatabaseHelper.taskTable}
      WHERE deadLineTime >= ? AND deadLineTime < ?
      ''';

      List<Map<String, Object?>> records = await db.rawQuery(query, [
        Utils.formatDateToYYYYMMDD(time),
        Utils.formatDateToYYYYMMDD(time.add(const Duration(days: 1))),
      ]);

      list = records;
    } catch (e) {
      rethrow;
    }

    return list;
  }

  Future<List<Map<String, dynamic>>>? getAllCategories() async {
    List<Map<String, dynamic>>? list;
    try {
      const query = 'SELECT * FROM ${DatabaseHelper.categoryTable}';
      List<Map<String, Object?>> records = await db.rawQuery(query);

      list = records;
    } catch (e) {
      rethrow;
    }

    return list;
  }

  Future<List<Map<String, dynamic>>>? getAllPomodoroFromDb() async {
    List<Map<String, dynamic>>? list;
    try {
      const query = 'SELECT * FROM ${DatabaseHelper.pomodoroTable}';
      List<Map<String, Object?>> records = await db.rawQuery(query);

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
      const query = '''
      SELECT * FROM ${DatabaseHelper.pomodoroTable}
      WHERE dateTime >= ? AND dateTime < ?
      ''';

      List<Map<String, Object?>> records = await db.rawQuery(query, [
        Utils.formatDateToYYYYMMDD(time),
        Utils.formatDateToYYYYMMDD(time.add(const Duration(days: 1))),
      ]);

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

  Future<Map<String, dynamic>?> getAnalysisPageData() async {
    late Map<String, dynamic>? item;
    try {
      int todayCompletedTask = await getCompletedTaskQuantity();
      List<Map<String, dynamic>>? allPomodoroList =
          await getAllPomodoroFromDb();
      List<Map<String, dynamic>>? todayPomodoroList =
          await getAllTodayPomodoroFromDb(DateTime.now());
      int todayPomodoroCount = todayPomodoroList?.length ?? 0;

      item = {
        "overviews": allPomodoroList,
        "yearlyAnalyze": allPomodoroList,
        "todayPomodoroCount": todayPomodoroCount,
        "todayCompletedTask": todayCompletedTask,
      };
    } catch (e, s) {
      dPrint("$e $s");
      rethrow;
    }

    return item;
  }

  Future<bool> saveDailyGoal(int count) async {
    try {
      Map<String, Object?> data = {
        "count": count,
        "dateTime": DateTime.now().toString()
      };
      await db.insert(DatabaseHelper.dailyGoalTable, data);
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<int?> getDailyGoalQuantity() async {
    int? count;
    try {
      const query = '''
      SELECT * FROM ${DatabaseHelper.dailyGoalTable}
      WHERE dateTime >= ? AND dateTime < ?
      ''';

      List<Map<String, dynamic>> records = await db.rawQuery(query, [
        Utils.formatDateToYYYYMMDD(DateTime.now()),
        Utils.formatDateToYYYYMMDD(DateTime.now().add(const Duration(days: 1))),
      ]);

      if (records.isNotEmpty) {
        count = int.parse(records.first["count"]);
      }
    } catch (e) {
      rethrow;
    }

    return count;
  }

  Future<bool?> checkDailyGoal() async {
    bool? result;
    try {
      const query = '''
      SELECT * FROM ${DatabaseHelper.dailyGoalTable}
      WHERE dateTime >= ? AND dateTime < ?
      ''';

      List<Map<String, dynamic>> records = await db.rawQuery(query, [
        Utils.formatDateToYYYYMMDD(DateTime.now()),
        Utils.formatDateToYYYYMMDD(DateTime.now().add(const Duration(days: 1))),
      ]);

      result = records.isNotEmpty;
    } catch (e) {
      dPrint(e.toString());
      rethrow;
    }

    return result;
  }

  Future<String?> editTask(TaskEntity task) async {
    String? result;
    try {
      await db.update(
        DatabaseHelper.taskTable,
        TaskModel.toDbQuery(task),
        where: "uid = ?",
        whereArgs: [task.id],
      );

      result = task.id;
    } catch (e) {
      rethrow;
    }

    return result;
  }

  Future<String?> completeTask(TaskEntity task) async {
    String? result;
    try {
      await db.update(
        DatabaseHelper.taskTable,
        TaskModel.toDbQuery(task, isCompleted: true),
        where: "uid = ?",
        whereArgs: [task.id],
      );

      result = task.id;
    } catch (e) {
      rethrow;
    }

    return result;
  }

  Future<String?> deleteTask(String id) async {
    String? result;
    try {
      await db.delete(
        DatabaseHelper.taskTable,
        where: "uid = ?",
        whereArgs: [id],
      );

      result = id;
    } catch (e) {
      rethrow;
    }

    return result;
  }

  getTaskById(String id) {}

  getCompletedTask() {}
}
