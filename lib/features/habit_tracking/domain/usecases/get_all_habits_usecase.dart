import "package:dartz/dartz.dart";
import "package:pomodore/core/resources/usecase.dart";

import "package:pomodore/features/habit_tracking/domain/entities/habit_entity.dart";
import "package:pomodore/features/habit_tracking/domain/repositories/habit_tracking_repository.dart";

class GetAllHabitUseCase
    extends UseCase<Either<String, List<HabitEntity>>, String> {
  final HabitTrackingRepository repository;

  GetAllHabitUseCase(this.repository);

  @override
  Future<Either<String, List<HabitEntity>>> call({String? params}) {
    return repository.getAllHabits();
  }
}
