import "package:dartz/dartz.dart";
import "package:pomodore/core/resources/usecase.dart";
import "package:pomodore/features/habit_tracking/domain/entities/habit_entity.dart";
import "package:pomodore/features/habit_tracking/domain/repositories/habit_tracking_repository.dart";

class DoneTodayHabitUseCase extends UseCase<Either<String, HabitEntity>, int> {
  final HabitTrackingRepository habitTrackingRepository;

  DoneTodayHabitUseCase(this.habitTrackingRepository);

  @override
  Future<Either<String, HabitEntity>> call({int? params}) {
    return habitTrackingRepository.completeHabit(params!);
  }
}
