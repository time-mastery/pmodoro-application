import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String taskTitle, taskDescription, timerValue;
  final double taskTimeDeadline, taskDoneTime;
  final DateTime taskDateDeadline, taskDoneDate;
  final bool taskDone;

  const TaskEntity(
      {required this.taskTitle,
      required this.taskDescription,
      required this.timerValue,
      required this.taskTimeDeadline,
      required this.taskDoneTime,
      required this.taskDateDeadline,
      required this.taskDoneDate,
      required this.taskDone});

  @override
  List<Object?> get props => [
        taskTitle,
        taskDescription,
        timerValue,
        taskTimeDeadline,
        taskDoneTime,
        taskDateDeadline,
        taskDoneDate,
        taskDone,
      ];
}
