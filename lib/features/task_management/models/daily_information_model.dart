import "package:equatable/equatable.dart";

class DailyInformationModel extends Equatable {
  final int taskQuantity;
  final int completedTaskQuantity;
  final int dailyGoalQuantity;
  final double processPercentage;

  const DailyInformationModel({
    required this.taskQuantity,
    required this.completedTaskQuantity,
    required this.dailyGoalQuantity,
    required this.processPercentage,
  });

  static DailyInformationModel fromJson(Map<String, dynamic> item) =>
      DailyInformationModel(
        taskQuantity: item["taskQuantity"],
        completedTaskQuantity: item["completedTaskQuantity"],
        processPercentage: item["processPercentage"],
        dailyGoalQuantity: item["dailyGoalQuantity"],
      );

  static Map<String, num> toJson(DailyInformationModel item) => {
        "taskQuantity": item.taskQuantity,
        "completedTaskQuantity": item.completedTaskQuantity,
        "processPercentage": item.processPercentage,
        "dailyGoalQuantity": item.dailyGoalQuantity,
      };

  @override
  List<Object?> get props => [
        taskQuantity,
        completedTaskQuantity,
        dailyGoalQuantity,
        processPercentage
      ];
}
