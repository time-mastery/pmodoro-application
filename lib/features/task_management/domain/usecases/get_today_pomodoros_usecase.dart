import 'package:dartz/dartz.dart';
import 'package:pomodore/core/resources/usecase.dart';
import 'package:pomodore/features/task_management/domain/entities/pomodoro_entity.dart';
import 'package:pomodore/features/task_management/domain/repositories/task_repository.dart';

class GetTodayPomodorosUseCase
    extends UseCase<Either<String, List<PomodoroEntity>>, DateTime> {
  final TaskRepository _taskRepository;

  GetTodayPomodorosUseCase(this._taskRepository);

  @override
  Future<Either<String, List<PomodoroEntity>>> call({DateTime? params}) {
    return _taskRepository.getAllPomodoros();
  }
}
