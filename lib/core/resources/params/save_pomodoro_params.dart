import "package:pomodore/features/task_management/domain/entities/pomodoro_entity.dart";

class SavePomodoroParams {
  final PomodoroEntity entity;
  final bool shouldSave;

  SavePomodoroParams({
    required this.entity,
    required this.shouldSave,
  });
}
