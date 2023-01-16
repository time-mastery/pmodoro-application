import 'package:equatable/equatable.dart';

class DailyInformationEntity extends Equatable {
  final int taskQuantity;
  final int completedTaskQuantity;
  final double processPercentage;

  const DailyInformationEntity({
    required this.taskQuantity,
    required this.completedTaskQuantity,
    required this.processPercentage,
  });

  @override
  List<Object> get props => [taskQuantity, completedTaskQuantity, processPercentage];
}
