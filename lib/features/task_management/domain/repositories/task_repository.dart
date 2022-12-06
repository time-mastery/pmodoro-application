import 'package:pomodore/core/resources/data_state.dart';
import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';

abstract class TaskRepository {
  Future<DataState<bool>> addTask(TaskEntity task);

  Future getTaskByDate(DateTime date);

  Future getTaskById(String id);

  Future deleteTask(String id);

  Future getCompletedTask();
}
