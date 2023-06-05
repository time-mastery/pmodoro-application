import "package:dartz/dartz.dart";
import "package:pomodore/features/habit_tracking/domain/entities/habit_entity.dart";

import "../../../../core/resources/params/habit_params.dart";

abstract class HabitTrackingRepository {
  Future<Either<String, List<HabitEntity>>> getAllHabits();
  Future<Either<String, int>> deleteHabit(int id);
  Future<Either<String, bool>> updateHabit(HabitParams updatedHabit);
  Future<Either<String, bool>> addHabit(HabitParams habit);
  Future<Either<String, bool>> doneHabit(String id);
}
