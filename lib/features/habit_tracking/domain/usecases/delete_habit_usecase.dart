import "package:dartz/dartz.dart";
import "package:pomodore/core/resources/usecase.dart";
import "package:pomodore/features/habit_tracking/domain/repositories/habit_tracking_repository.dart";

class DeleteHabitUseCase extends UseCase<Either<String, bool>, int> {
  final HabitTrackingRepository repository;

  DeleteHabitUseCase(this.repository);
  @override
  Future<Either<String, bool>> call({int? params}) {
    return repository.deleteHabit(params!);
  }
}