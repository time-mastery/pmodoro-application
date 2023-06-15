import "package:isar/isar.dart";

@collection
class HabitCollection {
  Id id = Isar.autoIncrement;
  String? uuid;
  String? habitTitle;
  String? habitDescription;
  String? habitIcon;
  int? habitColor;
}
