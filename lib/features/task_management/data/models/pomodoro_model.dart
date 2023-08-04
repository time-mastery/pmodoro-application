import "package:pomodore/core/services/database/collections/pomodoro_collection.dart";
import "package:pomodore/features/task_management/domain/entities/pomodoro_entity.dart";

class PomodoroModel extends PomodoroEntity {
  const PomodoroModel(
    int id,
    int duration,
    String? taskUid,
    DateTime datetime,
  ) : super(
          id: id,
          duration: duration,
          taskUid: taskUid,
          dateTime: datetime,
        );

  static PomodoroModel fromJson(Map<String, dynamic> item) => PomodoroModel(
        item["_id"],
        item["duration"],
        item["taskUid"],
        DateTime.parse(
          item["datetime"],
        ),
      );

  static Map<String, Object?> toJson(PomodoroEntity item) => {
        "taskUid": item.taskUid,
        "duration": item.duration,
        "dateTime": item.dateTime,
      };

  static PomodoroModel pomodoroCollectionToModel(
          PomodoroCollection collection) =>
      PomodoroModel(
        collection.id,
        collection.duration ?? 0,
        collection.taskUid,
        DateTime.parse(collection.dateTime!),
      );

  static PomodoroEntity pomodoroModelToEntity(PomodoroModel model) =>
      PomodoroEntity(
        id: model.id,
        taskUid: model.taskUid,
        duration: model.duration,
        dateTime: model.dateTime,
      );
}
