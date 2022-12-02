class TaskParams {
  final String taskTitle, taskDescription;
  final DateTime taskDateTimeDeadline;
  final DateTime? taskDoneDatetime;
  final bool? taskDone;

  TaskParams({
    required this.taskTitle,
    required this.taskDescription,
    required this.taskDateTimeDeadline,
    this.taskDoneDatetime,
    this.taskDone = false,
  });

  static convertParamsToHiveMap(String id, TaskParams item) => {
        "id": id,
        "taskTitle": item.taskTitle,
        "taskDescription": item.taskDescription,
        "taskDateTimeDeadline": item.taskDateTimeDeadline,
        "taskDoneDatetime": item.taskDoneDatetime,
        "taskDone": item.taskDone,
      };
}
