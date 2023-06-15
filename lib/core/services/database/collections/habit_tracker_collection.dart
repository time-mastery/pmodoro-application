import "package:isar/isar.dart";

@collection
class HabitTrackerCollection {
  Id id = Isar.autoIncrement;
  String? habitId;
  DateTime? dateTime;
}
