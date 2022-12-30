import 'package:dartz/dartz.dart';
import 'package:pomodore/core/resources/usecase.dart';
import 'package:pomodore/features/task_management/domain/entities/pomodoro_entity.dart';
import 'package:pomodore/features/task_management/domain/repositories/task_repository.dart';

class AddPomodoroToDbUseCase
    extends UseCase<Either<String, bool>, PomodoroEntity> {
  final TaskRepository _taskRepository;

  AddPomodoroToDbUseCase(this._taskRepository);

  @override
  Future<Either<String, bool>> call({PomodoroEntity? params}) {
    return _taskRepository.savePomodoroInDb(params!);
  }
}
