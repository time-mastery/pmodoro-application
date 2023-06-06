import "package:dartz/dartz.dart";
import "package:pomodore/core/resources/usecase.dart";
import "package:pomodore/features/habit_tracking/domain/entities/habit_entity.dart";
import "package:pomodore/features/habit_tracking/domain/repositories/habit_tracking_repository.dart";

import "../../../../core/resources/params/habit_params.dart";

class AddNewHabitUseCase extends UseCase<Either<String, bool>, HabitParams> {
  final HabitTrackingRepository repository;

  AddNewHabitUseCase(this.repository);
  @override
  Future<Either<String, bool>> call({HabitParams? params}) {
    return repository.addHabit(params!);
  }
}
