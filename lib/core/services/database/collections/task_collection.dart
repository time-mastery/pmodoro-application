import "package:isar/isar.dart";

@collection
class TaskCollection {
  Id id = Isar.autoIncrement;
  String? uid;
  String? title;
  String? description;
  DateTime? deadLineTime;
  String? category;
  DateTime? doneTime;
  bool? done;
}
