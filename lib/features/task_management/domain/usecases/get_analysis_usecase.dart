import "package:dartz/dartz.dart";
import "package:pomodore/core/resources/usecase.dart";
import "package:pomodore/features/task_management/domain/entities/analysis_entity.dart";
import "package:pomodore/features/task_management/domain/repositories/task_repository.dart";

class GetAnalysisUseCase
    extends UseCase<Either<String, AnalysisEntity>, DateTime> {
  final TaskRepository taskRepository;

  GetAnalysisUseCase(this.taskRepository);

  @override
  Future<Either<String, AnalysisEntity>> call({DateTime? params}) {
    return taskRepository.getAnalysis();
  }
}
