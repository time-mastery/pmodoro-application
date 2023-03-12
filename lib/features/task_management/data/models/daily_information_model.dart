import "package:pomodore/features/task_management/domain/entities/daily_information_entity.dart";

class DailyInformationModel extends DailyInformationEntity {
  const DailyInformationModel({
    required int taskQuantity,
    required int completedTaskQuantity,
    required int dailyGoalQuantity,
    required double processPercentage,
  }) : super(
          taskQuantity: taskQuantity,
          completedTaskQuantity: completedTaskQuantity,
          processPercentage: processPercentage,
          dailyGoalQuantity: dailyGoalQuantity,
        );

  static DailyInformationModel fromJson(Map<String, dynamic> item) => DailyInformationModel(
        taskQuantity: item["taskQuantity"],
        completedTaskQuantity: item["completedTaskQuantity"],
        processPercentage: item["processPercentage"],
        dailyGoalQuantity: item["dailyGoalQuantity"],
      );

  static Map<String, num> toJson(DailyInformationEntity item) => {
        "taskQuantity": item.taskQuantity,
        "completedTaskQuantity": item.completedTaskQuantity,
        "processPercentage": item.processPercentage,
        "dailyGoalQuantity": item.dailyGoalQuantity,
      };
}
