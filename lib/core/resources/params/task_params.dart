class TaskParams {
  final int? id;
  final String? taskTitle, taskDescription, uid;
  final DateTime? taskDateTimeDeadline;
  final DateTime? taskDoneDatetime;
  final bool? taskDone;

  TaskParams({
    this.id,
    this.uid,
    this.taskTitle,
    this.taskDescription,
    this.taskDateTimeDeadline,
    this.taskDoneDatetime,
    this.taskDone,
  });

  static Map<String, Object?> convertParamsToMap(TaskParams item) => {
        "id": item.id,
        "uid": item.uid,
        "taskTitle": item.taskTitle,
        "taskDescription": item.taskDescription,
        "taskDateTimeDeadline": item.taskDateTimeDeadline,
        "taskDoneDatetime": item.taskDoneDatetime,
        "taskDone": item.taskDone,
      };
}
