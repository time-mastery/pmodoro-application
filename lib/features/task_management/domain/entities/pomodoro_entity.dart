import "package:equatable/equatable.dart";

class PomodoroEntity extends Equatable {
  final int? id, duration;
  final String? taskUid;
  final String dateTime;

  const PomodoroEntity({
    this.id,
    required this.duration,
    required this.dateTime,
    this.taskUid,
  });

  @override
  List<Object?> get props => [id, duration, taskUid];
}
