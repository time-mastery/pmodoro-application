import "package:equatable/equatable.dart";
import "package:pomodore/core/services/database/drift_helper.dart";

class TaskModel extends Equatable {
  final int id;
  final String uid;
  final String title;
  final String description;
  final DateTime deadLineTime;
  final DateTime? doneTime;
  final String category;
  final bool done;

  const TaskModel({
    required this.id,
    required this.uid,
    required this.title,
    required this.description,
    required this.deadLineTime,
    this.doneTime,
    required this.category,
    required this.done,
  });

  static TaskModel collectionToModel(Task item) => TaskModel(
        id: item.id,
        uid: item.uid ?? "",
        title: item.title ?? "",
        description: item.description ?? "",
        deadLineTime: DateTime.parse(item.deadLineTime!),
        doneTime: item.doneTime == null ? null : DateTime.parse(item.doneTime!),
        category: item.category ?? "",
        done: item.done ?? false,
      );

  static Map<String, Object> toJson(TaskModel item,
          {bool isCompleted = false}) =>
      {
        "id": item.id,
        "uid": item.uid,
        "title": item.title,
        "description": item.description,
        "category": item.category,
        "deadLineTime": item.deadLineTime.toString(),
        "doneTime": item.doneTime?.toString() ?? "",
        "done": isCompleted
            ? 1
            : item.done
                ? 1
                : 0,
      };

  static TaskModel fromJson(Map<String, dynamic> item) => TaskModel(
        id: item["id"],
        uid: item["uid"],
        title: item["title"],
        description: item["description"],
        category: item["category"],
        deadLineTime: DateTime.parse(item["deadLineTime"]),
        doneTime:
            item["doneTime"] == null ? null : DateTime.parse(item["doneTime"]),
        done: item["done"] == 1,
      );

  static List<TaskModel> sortTasksByDateTime(List<TaskModel> items) {
    items.sort((a, b) => a.deadLineTime.compareTo(b.deadLineTime));
    return items;
  }

  @override
  List<Object?> get props =>
      [id, uid, title, description, deadLineTime, doneTime, category, done];
}
