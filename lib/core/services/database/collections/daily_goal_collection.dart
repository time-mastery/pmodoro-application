import "package:isar/isar.dart";

// part "daily_goal_collection.g.dart";

// @collection
// class DailyGoalCollection {
//   Id id = Isar.autoIncrement;
//   int? count;
//   String? dateTime;
// }

class DailyGoalCollection {
  final int id;
  final int? count;
  final String? dateTime;

  DailyGoalCollection(
      {required this.id, required this.count, required this.dateTime});
}
