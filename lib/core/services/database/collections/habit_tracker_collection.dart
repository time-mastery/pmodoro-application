import "package:isar/isar.dart";

// part "habit_tracker_collection.g.dart";

// @collection
// class HabitTrackerCollection {
//   Id id = Isar.autoIncrement;
//   String? habitId;
//   DateTime? dateTime;
// }

class HabitTrackerCollection {
  final int id;
  final String? habitId;
  final DateTime? dateTime;

  HabitTrackerCollection(
      {required this.id, required this.habitId, required this.dateTime});
}
