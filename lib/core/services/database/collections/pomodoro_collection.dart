import "package:isar/isar.dart";

part "pomodoro_collection.g.dart";

@collection
class PomodoroCollection {
  Id id = Isar.autoIncrement;
  String? taskUid;
  int? duration;
  DateTime? dateTime;
}
