import "package:pomodore/features/task_management/domain/entities/daily_information_entity.dart";

class DailyInformationModel extends DailyInformationEntity {
  const DailyInformationModel({
    required super.taskQuantity,
    required super.completedTaskQuantity,
    required super.dailyGoalQuantity,
    required super.processPercentage,
  });

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
