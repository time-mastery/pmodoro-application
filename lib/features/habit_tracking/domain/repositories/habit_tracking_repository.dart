import "package:dartz/dartz.dart";
import "package:pomodore/core/resources/params/no_params.dart";
import "package:pomodore/features/habit_tracking/domain/entities/habit_entity.dart";

import "../../../../core/resources/params/habit_params.dart";

abstract class HabitTrackingRepository {
  Future<Either<String, List<HabitEntity>>> getAllHabits();

  Future<Either<String, NoParams>> deleteHabit(int id);

  Future<Either<String, HabitEntity>> updateHabit(HabitParams updatedHabit);

  Future<Either<String, int>> addHabit(HabitParams habit);

  Future<Either<String, HabitEntity>> completeHabit(int id);
}
