import "package:isar/isar.dart";

@collection
class PomodoroCollection {
  Id id = Isar.autoIncrement;
  String? taskUid;
  int? duration;
  DateTime? dateTime;
}
