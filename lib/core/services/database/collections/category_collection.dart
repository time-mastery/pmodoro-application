import "package:isar/isar.dart";

@collection
class CategoryCollection {
  Id id = Isar.autoIncrement;
  String? title;
}
