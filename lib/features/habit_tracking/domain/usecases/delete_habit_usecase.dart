import "package:dartz/dartz.dart";
import "package:pomodore/core/resources/params/no_params.dart";
import "package:pomodore/core/resources/usecase.dart";
import "package:pomodore/features/habit_tracking/domain/repositories/habit_tracking_repository.dart";

class DeleteHabitUseCase extends UseCase<Either<String, NoParams>, int> {
  final HabitTrackingRepository repository;

  DeleteHabitUseCase(this.repository);

  @override
  Future<Either<String, NoParams>> call({int? params}) {
    return repository.deleteHabit(params!);
  }
}
