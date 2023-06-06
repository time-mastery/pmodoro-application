import "package:pomodore/core/resources/params/habit_params.dart";
import "package:pomodore/core/utils/debug_print.dart";
import "package:pomodore/features/habit_tracking/data/data_sources/habit_local_data_source.dart";
import "package:pomodore/features/habit_tracking/data/models/habit_model.dart";
import "package:pomodore/features/habit_tracking/domain/entities/habit_entity.dart";
import "package:dartz/dartz.dart";
import "package:pomodore/features/habit_tracking/domain/repositories/habit_tracking_repository.dart";

class HabitTrackingRepositoryImpl implements HabitTrackingRepository {
  final HabitLocalDataSource localDataSource;

  const HabitTrackingRepositoryImpl(this.localDataSource);

  @override
  Future<Either<String, bool>> addHabit(HabitParams habit) async {
    late Either<String, bool> result;
    try {
      bool addState = await localDataSource.addHabit(habit);
      result = Right(addState);
    } catch (e, s) {
      dPrint("$e    $s");
      result = const Left("error");
    }

    return result;
  }

  @override
  Future<Either<String, int>> deleteHabit(int id) async {
    late Either<String, int> result;

    try {
      await localDataSource.deleteHabit(id);

      result = Right(id);
    } catch (e, s) {
      dPrint("$e  $s");
      result = const Left("error");
    }

    return result;
  }

  @override
  Future<Either<String, HabitEntity>> doneHabit(
      HabitOverviewParams params) async {
    try {
      Map? rawItem = await localDataSource.completeHabit(params);
      if (rawItem == null) return const Left("error");
      HabitEntity habit = HabitModel.fromJson(rawItem);

      return Right(habit);
    } catch (e, s) {
      dPrint("$e    $s");
      return const Left("error");
    }
  }

  @override
  Future<Either<String, List<HabitEntity>>> getAllHabits() async {
    late Either<String, List<HabitEntity>> result;
    try {
      List<Map>? data = await localDataSource.getAllHabits();

      if (data == null) result = const Left("error");

      result = Right(data!.map((e) => HabitModel.fromJson(e)).toList());
    } catch (e, s) {
      dPrint("$e  $s");
      result = const Left("error");
    }

    return result;
  }

  @override
  Future<Either<String, HabitEntity>> updateHabit(
      HabitParams updatedHabit) async {
    try {
      Map? item = await localDataSource.editHabit(updatedHabit);

      if (item == null) return const Left("error");

      return Right(HabitModel.fromJson(item));
    } catch (e, s) {
      dPrint("$e    $s");
      return const Left("error");
    }
  }
}
