import "package:isar/isar.dart";

part "category_collection.g.dart";

@collection
class CategoryCollection {
  Id id = Isar.autoIncrement;
  String? title;
}
