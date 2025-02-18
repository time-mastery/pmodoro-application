import "package:isar/isar.dart";

// part "category_collection.g.dart";

// @collection
// class CategoryCollection {
//   Id id = Isar.autoIncrement;
//   String? title;
// }

class CategoryCollection {
  final int id;
  final String? title;

  CategoryCollection({required this.id, required this.title});
}
