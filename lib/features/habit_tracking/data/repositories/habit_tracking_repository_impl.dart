import "package:dartz/dartz.dart";
import "package:pomodore/core/resources/params/habit_params.dart";
import "package:pomodore/core/resources/params/no_params.dart";
import "package:pomodore/core/utils/debug_print.dart";
import "package:pomodore/features/habit_tracking/data/data_sources/habit_local_data_source.dart";
import "package:pomodore/features/habit_tracking/data/models/habit_model.dart";
import "package:pomodore/features/habit_tracking/domain/entities/habit_entity.dart";
import "package:pomodore/features/habit_tracking/domain/repositories/habit_tracking_repository.dart";

class HabitTrackingRepositoryImpl implements HabitTrackingRepository {
  final HabitLocalDataSource localDataSource;

  const HabitTrackingRepositoryImpl(this.localDataSource);

  @override
  Future<Either<String, int>> addHabit(HabitParams habit) async {
    try {
      int? addState = await localDataSource.addHabit(habit);
      if (addState == null) return const Left("error");
      return Right(addState);
    } catch (e, s) {
      dPrint("$e    $s");
      return const Left("error");
    }
  }

  @override
  Future<Either<String, NoParams>> deleteHabit(int id) async {
    late Either<String, NoParams> result;

    try {
      await localDataSource.deleteHabit(id);

      result = Right(NoParams());
    } catch (e, s) {
      dPrint("$e  $s");
      result = const Left("error");
    }

    return result;
  }

  @override
  Future<Either<String, HabitEntity>> completeHabit(int id) async {
    try {
      HabitModel? habitModel = await localDataSource.completeHabit(id);
      if (habitModel == null) return const Left("error");
      HabitEntity habit = HabitModel.getEntity(habitModel);

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
      List<HabitModel>? data = await localDataSource.getAllHabits();

      if (data == null) result = const Left("error");

      result = Right(data!.map((e) => HabitModel.getEntity(e)).toList());
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
      HabitModel? item = await localDataSource.editHabit(updatedHabit);

      if (item == null) return const Left("error");

      return Right(HabitModel.getEntity(item));
    } catch (e, s) {
      dPrint("$e    $s");
      return const Left("error");
    }
  }
}
