import 'package:dartz/dartz.dart';
import 'package:pomodore/core/resources/usecase.dart';
import 'package:pomodore/features/task_management/domain/repositories/task_repository.dart';

class CheckDailyGoalUseCase extends UseCase<Either<String, bool>, DateTime> {
  final TaskRepository taskRepository;

  CheckDailyGoalUseCase(this.taskRepository);

  @override
  Future<Either<String, bool>> call({DateTime? params}) {
    return taskRepository.checkDailyGoal();
  }
}
