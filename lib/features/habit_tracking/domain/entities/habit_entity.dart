import "package:equatable/equatable.dart";

class HabitEntity extends Equatable {
  final Map<DateTime, int> overviews;
  final String title, desctription, iconName;
  final int id;
  final int color;

  const HabitEntity({
    required this.overviews,
    required this.title,
    required this.color,
    required this.desctription,
    required this.iconName,
    required this.id,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        color,
        desctription,
        iconName,
        overviews,
      ];
}
