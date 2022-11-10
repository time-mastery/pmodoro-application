class TaskModel {
  final String taskTitle, taskDescription;
  final double taskTimeDeadline, taskDoneTime;
  final DateTime taskDateDeadline, taskDoneDate;
  final bool taskDone;

  TaskModel(
      this.taskTitle,
      this.taskDescription,
      this.taskTimeDeadline,
      this.taskDoneTime,
      this.taskDateDeadline,
      this.taskDoneDate,
      this.taskDone);

  toJson(TaskModel item) => {
        "taskTitle": item.taskTitle,
        "taskDescription": item.taskDescription,
        "taskTimeDeadline": item.taskDateDeadline,
        "taskDoneTime": item.taskDoneTime,
        "taskDateDeadline": item.taskDateDeadline,
        "taskDoneDate": item.taskDoneDate,
        "taskDone": item.taskDone
      };
}
