import 'package:dartz/dartz.dart';
import 'package:pomodore/features/task_management/domain/entities/analysis_entity.dart';
import 'package:pomodore/features/task_management/domain/entities/daily_information_entity.dart';
import 'package:pomodore/features/task_management/domain/entities/pomodoro_entity.dart';
import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';

abstract class TaskRepository {
  Future<Either<String, bool>> addTask(TaskEntity task);

  Future<Either<String, List<TaskEntity>>> getTaskByDate(DateTime date);

  Future<Either<String, int?>> completeTask(TaskEntity taskEntity);

  Future<Either<String, int?>> deleteTask(String id);

  Future<Either<String, bool>> savePomodoroInDb(PomodoroEntity item);

  Future<Either<String, List<PomodoroEntity>>> getAllTodayPomodoros();

  Future<Either<String, DailyInformationEntity>> getDailyInformation();

  Future<Either<String, AnalysisEntity>> getAnalysis();

  Future getTaskById(String id);

  Future getCompletedTask();
}
