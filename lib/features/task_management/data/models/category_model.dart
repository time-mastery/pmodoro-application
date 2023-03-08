import 'package:pomodore/features/task_management/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel(int? id, String title) : super(id: id, title: title);

  static toJson(CategoryEntity item) => {
        "title": item.title,
      };

  static fromJson(Map<String, dynamic> item) => CategoryEntity(
        id: item["_id"],
        title: item["title"],
      );

  static List<CategoryEntity> parseRawList(List<Map<String, dynamic>> items) {
    late List<CategoryEntity> list;
    list = items.map<CategoryEntity>((e) => fromJson(e)).toList();
    return list;
  }
}
