import 'package:dartz/dartz.dart';
import 'package:pomodore/core/resources/usecase.dart';
import 'package:pomodore/features/task_management/domain/entities/daily_information_entity.dart';
import 'package:pomodore/features/task_management/domain/repositories/task_repository.dart';

class GetDailyInformationUseCase extends UseCase<Either<String, DailyInformationEntity>, DateTime> {
  final TaskRepository _taskRepository;

  GetDailyInformationUseCase(this._taskRepository);

  @override
  Future<Either<String, DailyInformationEntity>> call({DateTime? params}) {
    return _taskRepository.getDailyInformation();
  }
}
