import "package:equatable/equatable.dart";

class HabitEntity extends Equatable {
  final Map<DateTime, int> overviews;
  final String title, desctription, iconName;

  const HabitEntity({
    required this.overviews,
    required this.title,
    required this.desctription,
    required this.iconName,
  });

  @override
  List<Object?> get props => [
        title,
        desctription,
        iconName,
        overviews,
      ];
}
