import "package:dartz/dartz.dart";
import "package:pomodore/core/resources/params/task_params.dart";
import "package:pomodore/features/task_management/domain/entities/analysis_entity.dart";
import "package:pomodore/features/task_management/domain/entities/daily_information_entity.dart";
import "package:pomodore/features/task_management/domain/entities/pomodoro_entity.dart";
import "package:pomodore/features/task_management/domain/entities/task_entity.dart";

abstract class TaskRepository {
  Future<Either<String, bool>> addTask(TaskParams task);

  Future<Either<String, List<TaskEntity>>> getTaskByDate(DateTime date);

  Future<Either<String, List<TaskEntity>>> getUnCompletedTasks();

  Future<Either<String, List<TaskEntity>>> getAllTasks();

  Future<Either<String, List<PomodoroEntity>>> getAllTodayPomodoro();

  Future<Either<String, DailyInformationEntity>> getDailyInformation();

  Future<Either<String, AnalysisEntity>> getAnalysis();

  Future<Either<String, bool>> checkDailyGoal();

  Future<Either<String, bool>> saveDailyGoal(int count);

  Future<Either<String, String>> completeTask(TaskParams params);

  Future<Either<String, String>> editTask(TaskParams task);

  Future<Either<String, String>> deleteTask(int taskId);
}
