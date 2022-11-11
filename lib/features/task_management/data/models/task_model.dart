class TaskModel {
  final String taskTitle, taskDescription, timerValue;
  final double taskTimeDeadline, taskDoneTime;
  final DateTime taskDateDeadline, taskDoneDate;
  final bool taskDone;

  TaskModel(
      this.taskTitle,
      this.timerValue,
      this.taskDescription,
      this.taskTimeDeadline,
      this.taskDoneTime,
      this.taskDateDeadline,
      this.taskDoneDate,
      this.taskDone);

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
