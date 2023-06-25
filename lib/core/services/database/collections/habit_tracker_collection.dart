import "package:isar/isar.dart";

part "habit_tracker_collection.g.dart";

@collection
class HabitTrackerCollection {
  Id id = Isar.autoIncrement;
  String? habitId;
  DateTime? dateTime;
}
