import "package:isar/isar.dart";

part "task_collection.g.dart";

@collection
class TaskCollection {
  Id id = Isar.autoIncrement;
  String? uid;
  String? title;
  String? description;
  String? deadLineTime;
  String? category;
  String? doneTime;
  bool? done;
}
