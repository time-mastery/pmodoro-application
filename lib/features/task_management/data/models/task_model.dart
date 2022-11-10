import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel(
      String taskTitle,
      String timerValue,
      String taskDescription,
      double taskTimeDeadline,
      double taskDoneTime,
      DateTime taskDateDeadline,
      DateTime taskDoneDate,
      bool taskDone)
      : super(
          taskTitle: taskTitle,
          timerValue: timerValue,
          taskDescription: taskDescription,
          taskTimeDeadline: taskTimeDeadline,
          taskDoneTime: taskDoneTime,
          taskDateDeadline: taskDateDeadline,
          taskDoneDate: taskDoneDate,
          taskDone: taskDone,
        );

  factory TaskModel.fromJson(Map item) => TaskModel(
        item["taskTitle"],
        item["taskDescription"],
        item["timerValue"],
        item["taskTimeDeadline"],
        item["taskDoneTime"],
        item["taskDateDeadline"],
        item["taskDoneDate"],
        item["taskDone"],
      );

  static toJson(TaskModel item) => {
        "taskTitle": item.taskTitle,
        "timerValue": item.timerValue,
        "taskDescription": item.taskDescription,
        "taskTimeDeadline": item.taskDateDeadline,
        "taskDoneTime": item.taskDoneTime,
        "taskDateDeadline": item.taskDateDeadline,
        "taskDoneDate": item.taskDoneDate,
        "taskDone": item.taskDone
      };
}
