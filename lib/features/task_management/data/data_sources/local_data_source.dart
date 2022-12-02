import 'package:sqflite/sqflite.dart';

import '../../../../core/resources/params/task_params.dart';
import '../../../../core/utils/utils.dart';

class LocalDataSource {
  final Database db;

  LocalDataSource(this.db);

  addTask(TaskParams task) {
    String taskId = Utils.createUniqueId();
  }

  getTaskById(String id) {}

  deleteTask(String id) {}

  getTaskByDate(DateTime date) {}

  getCompletedTask() {}
}
