import "package:isar/isar.dart";

// part "task_collection.g.dart";

// @collection
// class TaskCollection {
//   Id id = Isar.autoIncrement;
//   String? uid;
//   String? title;
//   String? description;
//   String? deadLineTime;
//   String? category;
//   String? doneTime;
//   bool? done;
// }

class TaskCollection {
  final int id;
  final String? uid;
  final String? title;
  final String? description;
  final String? deadLineTime;
  final String? category;
  final String? doneTime;
  final bool? done;

  TaskCollection(
      {required this.id,
      required this.uid,
      required this.title,
      required this.description,
      required this.deadLineTime,
      required this.category,
      required this.doneTime,
      required this.done});
}
