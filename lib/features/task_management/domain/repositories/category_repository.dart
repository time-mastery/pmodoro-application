import 'package:dartz/dartz.dart';
import 'package:pomodore/features/task_management/domain/entities/category_entity.dart';

abstract class CategoryRepository {
  Future<Either<String, bool>> addCategory(CategoryEntity entity);

  Future<Either<String, List<CategoryEntity>>> getAllCategories();
}
