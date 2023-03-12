import "package:dartz/dartz.dart";
import "package:pomodore/features/task_management/domain/entities/category_entity.dart";
import "package:pomodore/features/task_management/domain/repositories/category_repository.dart";

import "../../../../core/resources/usecase.dart";

class GetAllCategoriesUseCase
    extends UseCase<Either<String, List<CategoryEntity>>, DateTime> {
  final CategoryRepository categoryRepository;

  GetAllCategoriesUseCase(this.categoryRepository);

  @override
  Future<Either<String, List<CategoryEntity>>> call({DateTime? params}) {
    return categoryRepository.getAllCategories();
  }
}
