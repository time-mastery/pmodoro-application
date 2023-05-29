import "package:dartz/dartz.dart";
import "package:pomodore/core/resources/usecase.dart";
import "package:pomodore/features/habit_tracking/domain/entities/habit_entity.dart";

class EditHabitUseCase extends UseCase<Either<String, bool>, HabitEntity> {
  @override
  Future<Either<String, bool>> call({HabitEntity? params}) {
    throw UnimplementedError();
  }
}
