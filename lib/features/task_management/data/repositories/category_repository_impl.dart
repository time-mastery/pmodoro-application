import 'package:dartz/dartz.dart';
import 'package:pomodore/features/task_management/data/data_sources/local_data_source.dart';
import 'package:pomodore/features/task_management/domain/entities/category_entity.dart';
import 'package:pomodore/features/task_management/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final LocalDataSource localDataSource;

  CategoryRepositoryImpl(this.localDataSource);

  @override
  Future<Either<String, bool>> addCategory(CategoryEntity entity) async {
    late Either<String, bool> result;
    bool state = await localDataSource.addCategory(entity);

    if (state) {
      result = const Right(true);
    } else {
      result = const Left("error");
    }
    return result;
  }

  @override
  Future<Either<String, List<CategoryEntity>>> getAllCategories() {
    throw UnimplementedError();
  }
}
