import 'package:dartz/dartz.dart';
import 'package:pomodore/core/resources/usecase.dart';
import 'package:pomodore/features/task_management/domain/repositories/task_repository.dart';

class SaveDailyGoalUseCase extends UseCase<Either<String, bool>, int> {
  final TaskRepository taskRepository;

  SaveDailyGoalUseCase(this.taskRepository);

  @override
  Future<Either<String, bool>> call({int? params}) {
    return taskRepository.saveDailyGoal(params!);
  }
}
