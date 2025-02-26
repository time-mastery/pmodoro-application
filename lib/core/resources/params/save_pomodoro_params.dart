import "package:pomodore/features/task_management/models/pomodoro_model.dart";

class SavePomodoroParams {
  final PomodoroModel entity;
  final bool shouldSave;

  SavePomodoroParams({
    required this.entity,
    required this.shouldSave,
  });
}
