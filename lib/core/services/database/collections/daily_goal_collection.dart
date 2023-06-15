import "package:isar/isar.dart";

@collection
class DailyGoalCollection {
  Id id = Isar.autoIncrement;
  String? count;
  DateTime? dateTime;
}
