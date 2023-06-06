import "package:dartz/dartz.dart";
import "package:pomodore/core/resources/params/habit_params.dart";
import "package:pomodore/core/resources/usecase.dart";
import "package:pomodore/features/habit_tracking/domain/entities/habit_entity.dart";
import "package:pomodore/features/habit_tracking/domain/repositories/habit_tracking_repository.dart";

class EditHabitUseCase
    extends UseCase<Either<String, HabitEntity>, HabitParams> {
  final HabitTrackingRepository repository;

  EditHabitUseCase(this.repository);
  @override
  Future<Either<String, HabitEntity>> call({HabitParams? params}) {
    return repository.updateHabit(params!);
  }
}
