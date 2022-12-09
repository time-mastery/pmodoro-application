import 'package:pomodore/features/task_management/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel(id, title) : super(id: id, title: title);

  static toDbQuery(CategoryEntity item) => {
        "title": item.title,
      };

  static fromQueryToTaskModel(Map<String, dynamic> item) => CategoryEntity(
        id: item["_id"],
        title: item["title"],
      );
}
