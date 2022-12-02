import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel(
    String id,
    String title,
    String description,
    DateTime deadLineTime,
    DateTime doneTime,
    bool done,
  ) : super(
          id: id,
          title: title,
          description: description,
          deadLineTime: deadLineTime,
          doneTime: doneTime,
          done: done,
        );

  factory TaskModel.fromJson(Map item) => TaskModel(
        item["id"],
        item["title"],
        item["description"],
        item["deadLineTime"],
        item["doneTime"],
        item["done"],
      );

  static toJson(TaskModel item) => {
        "id": item.id,
        "title": item.title,
        "description": item.description,
        "deadLineTime": item.deadLineTime,
        "doneTime": item.doneTime,
        "done": item.done
      };
}
