import "package:dartz/dartz.dart";
import "package:pomodore/core/resources/usecase.dart";

class DeleteHabitUseCase extends UseCase<Either<String, bool>, String> {
  @override
  Future<Either<String, bool>> call({String? params}) {
    throw UnimplementedError();
  }
}
