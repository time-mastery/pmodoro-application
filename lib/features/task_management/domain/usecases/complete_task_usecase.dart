import 'package:dartz/dartz.dart';
import 'package:pomodore/core/resources/usecase.dart';
import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';

class CompleteTaskUseCase extends UseCase<Either<String, int?>, TaskEntity> {
  @override
  Future<Either<String, int?>> call({TaskEntity? params}) {
    throw UnimplementedError();
  }
}
