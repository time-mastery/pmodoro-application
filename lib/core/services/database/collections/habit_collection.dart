import "package:isar/isar.dart";

part "habit_collection.g.dart";

@collection
class HabitCollection {
  Id id = Isar.autoIncrement;
  String? uuid;
  String? habitTitle;
  String? habitDescription;
  String? habitIcon;
  int? habitColor;
  List<String>? overviews;
}
