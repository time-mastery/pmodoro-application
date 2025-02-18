import "package:isar/isar.dart";

// part "pomodoro_collection.g.dart";

// @collection
// class PomodoroCollection {
//   Id id = Isar.autoIncrement;
//   String? taskUid;
//   int? duration;
//   String? dateTime;
// }

class PomodoroCollection {
  final int id;
  final String? taskUid;
  final int? duration;
  final String? dateTime;

  PomodoroCollection(
      {required this.id,
      required this.taskUid,
      required this.duration,
      required this.dateTime});
}
