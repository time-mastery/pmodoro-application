import 'package:pomodore/features/task_management/domain/entities/daily_information_entity.dart';

class DailyInformationModel extends DailyInformationEntity {
  const DailyInformationModel(
      {required int taskQuantity,
      required int completedTaskQuantity,
      required double processPercentage})
      : super(
          taskQuantity: taskQuantity,
          completedTaskQuantity: completedTaskQuantity,
          processPercentage: processPercentage,
        );

  static fromDbToDailyInformationModel(Map<String, dynamic> item) => DailyInformationModel(
        taskQuantity: item["taskQuantity"],
        completedTaskQuantity: item["completedTaskQuantity"],
        processPercentage: item["processPercentage"],
      );

  static toDbFromDailyInformationModel(DailyInformationEntity item) => {
        "taskQuantity": item.taskQuantity,
        "completedTaskQuantity": item.completedTaskQuantity,
        "processPercentage": item.processPercentage,
      };
}
