import 'package:dartz/dartz.dart';
import 'package:pomodore/core/resources/usecase.dart';
import 'package:pomodore/features/task_management/domain/entities/category_entity.dart';
import 'package:pomodore/features/task_management/domain/repositories/category_repository.dart';

class AddCategoryUsecase extends UseCase<Either<String, bool>, CategoryEntity> {
  final CategoryRepository _categoryRepository;

  AddCategoryUsecase(this._categoryRepository);

  @override
  Future<Either<String, bool>> call(CategoryEntity? params) {
    return _categoryRepository.addCategory(params!);
  }
}
