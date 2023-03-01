import 'package:dartz/dartz.dart';
import 'package:pomodore/core/resources/usecase.dart';
import 'package:pomodore/features/task_management/domain/entities/pomodoro_entity.dart';
import 'package:pomodore/features/task_management/domain/repositories/task_repository.dart';
import 'package:pomodore/features/task_management/domain/repositories/timer_repository.dart';

class AddPomodoroToDbUseCase
    extends UseCase<Either<String, bool>, PomodoroEntity> {
  final TimerRepository _timerRepository;

  AddPomodoroToDbUseCase(this._timerRepository);

  @override
  Future<Either<String, bool>> call({PomodoroEntity? params}) {
    return _timerRepository.savePomodoroInDb(params!);
  }
}
