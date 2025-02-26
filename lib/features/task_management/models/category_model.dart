import "package:equatable/equatable.dart";

class CategoryModel extends Equatable {
  final int? id;
  final String title;

  const CategoryModel({
    this.id,
    required this.title,
  });

  static Map<String, String> toJson(CategoryModel item) => {
        "title": item.title,
      };

  static CategoryModel fromJson(Map<String, dynamic> item) => CategoryModel(
        id: item["_id"],
        title: item["title"],
      );

  static List<CategoryModel> parseRawList(List<Map<String, dynamic>> items) {
    return items.map<CategoryModel>((e) => fromJson(e)).toList();
  }

  @override
  List<Object?> get props => [id, title];
}
