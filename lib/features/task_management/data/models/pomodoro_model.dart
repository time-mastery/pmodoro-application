import 'package:pomodore/features/task_management/domain/entities/pomodoro_entity.dart';

class PomodoroModel extends PomodoroEntity {
  const PomodoroModel(int id, int duration, String? taskUid, String datetime)
      : super(id: id, duration: duration, taskUid: taskUid, dateTime: datetime);

  static fromJson(Map<String, dynamic> item) => PomodoroModel(
      item["_id"], item["duration"], item["taskUid"], item["datetime"]);

  static toJson(PomodoroEntity item) => {
        "taskUid": item.taskUid,
        "duration": item.duration,
        "dateTime": item.dateTime,
      };

  static List<PomodoroEntity> parseRawList(List<Map<String, dynamic>> items) {
    late List<PomodoroEntity> list;
    list = items.map<PomodoroEntity>((e) => fromJson(e)).toList();
    return list;
  }
}
