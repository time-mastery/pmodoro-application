import "package:equatable/equatable.dart";

class HabitEntity extends Equatable {
  final Map<DateTime, int> overviews;
  final String title, description, iconName;
  final int id;
  final String uuid;
  final int color;
  final bool isCompleteToday;

  const HabitEntity({
    required this.overviews,
    required this.title,
    required this.color,
    required this.description,
    required this.iconName,
    required this.id,
    required this.uuid,
    this.isCompleteToday = false,
  });

  HabitEntity copyWith({
    Map<DateTime, int>? overviews,
    String? title,
    int? color,
    String? description,
    String? iconName,
    int? id,
    bool? isCompleteToday,
  }) {
    return HabitEntity(
      overviews: overviews ?? this.overviews,
      title: title ?? this.title,
      color: color ?? this.color,
      description: description ?? this.description,
      iconName: iconName ?? this.iconName,
      id: id ?? this.id,
      isCompleteToday: isCompleteToday ?? this.isCompleteToday,
      uuid: uuid,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        color,
        description,
        iconName,
        overviews,
        isCompleteToday,
      ];
}
