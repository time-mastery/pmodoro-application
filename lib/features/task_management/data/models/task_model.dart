import "package:pomodore/core/services/database/collections/task_collection.dart";
import "package:pomodore/features/task_management/domain/entities/task_entity.dart";

class TaskModel extends TaskEntity {
  const TaskModel(
    int id,
    String uid,
    String title,
    String description,
    DateTime deadLineTime,
    DateTime? doneTime,
    String category,
    bool done,
  ) : super(
          id: id,
          uid: uid,
          title: title,
          category: category,
          description: description,
          deadLineTime: deadLineTime,
          doneTime: doneTime,
          done: done,
        );

  static TaskModel collectionToModel(TaskCollection item) => TaskModel(
        item.id,
        item.uid ?? "",
        item.title ?? "",
        item.description ?? "",
        DateTime.parse(item.deadLineTime!),
        item.doneTime == null ? null : DateTime.parse(item.doneTime!),
        item.category ?? "",
        item.done ?? false,
      );

  static Map<String, Object> toJson(TaskEntity item,
          {bool isCompleted = false}) =>
      {
        "id": item.id,
        "uid": item.uid,
        "title": item.title,
        "description": item.description,
        "category": item.category,
        "deadLineTime": item.deadLineTime.toString(),
        "doneTime": item.doneTime.toString(),
        "done": isCompleted
            ? 1
            : item.done
                ? 1
                : 0,
      };

  static TaskEntity fromJson(Map<String, dynamic> item) => TaskEntity(
        id: item["id"],
        uid: item["uid"],
        title: item["title"],
        description: item["description"],
        category: item["category"],
        deadLineTime: DateTime.parse(item["deadLineTime"]),
        doneTime:
            item["doneTime"] == null ? null : DateTime.parse(item["doneTime"]),
        done: item["done"] == 1 ? true : false,
      );

  static TaskEntity fromModelToEntity(TaskModel model) => TaskEntity(
        id: model.id,
        title: model.title,
        description: model.description,
        deadLineTime: model.deadLineTime,
        category: model.category,
        done: model.done,
        uid: model.uid,
      );

  static List<TaskEntity> sortTasksByDateTime(List<TaskEntity> item) {
    item.sort((a, b) => a.deadLineTime.compareTo(b.deadLineTime));
    return item;
  }
}
