import 'package:pomodore/features/task_management/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel(int? id, String title) : super(id: id, title: title);

  static toDbQuery(CategoryEntity item) => {
        "title": item.title,
      };

  static fromQueryToTaskModel(Map<String, dynamic> item) => CategoryEntity(
        id: item["_id"],
        title: item["title"],
      );

  static List<CategoryEntity> parseRawList(List<Map<String, dynamic>> items) {
    late List<CategoryEntity> list;
    list = items.map<CategoryEntity>((e) => fromQueryToTaskModel(e)).toList();
    return list;
  }
}
