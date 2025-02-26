import "package:equatable/equatable.dart";
import "package:pomodore/core/services/database/drift_helper.dart";

class PomodoroModel extends Equatable {
  final int id;
  final int duration;
  final String? taskUid;
  final DateTime dateTime;

  const PomodoroModel({
    required this.id,
    required this.duration,
    this.taskUid,
    required this.dateTime,
  });

  static PomodoroModel fromJson(Map<String, dynamic> item) => PomodoroModel(
        id: item["_id"],
        duration: item["duration"],
        taskUid: item["taskUid"],
        dateTime: DateTime.parse(item["datetime"]),
      );

  static Map<String, Object?> toJson(PomodoroModel item) => {
        "taskUid": item.taskUid,
        "duration": item.duration,
        "dateTime": item.dateTime.toIso8601String(),
      };

  static PomodoroModel pomodoroCollectionToModel(Pomodoro collection) =>
      PomodoroModel(
        id: collection.id,
        duration: collection.duration ?? 0,
        taskUid: collection.taskUid,
        dateTime: DateTime.parse(collection.creationDateTime!),
      );

  @override
  List<Object?> get props => [id, duration, taskUid, dateTime];
}
