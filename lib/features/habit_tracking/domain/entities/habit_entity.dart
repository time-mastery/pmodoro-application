import "package:equatable/equatable.dart";

class HabitEntity extends Equatable {
  final Map<DateTime, int> overviews;
  final String title, desctription, iconName;
  final int id;
  final int color;
  final bool isCompleteToday;

  const HabitEntity({
    required this.overviews,
    required this.title,
    required this.color,
    required this.desctription,
    required this.iconName,
    required this.id,
    this.isCompleteToday = false,
  });

  HabitEntity copyWith({
    Map<DateTime, int>? overviews,
    String? title,
    int? color,
    String? desctription,
    String? iconName,
    int? id,
    bool? isCompleteToday,
  }) {
    return HabitEntity(
      overviews: overviews ?? this.overviews,
      title: title ?? this.title,
      color: color ?? this.color,
      desctription: desctription ?? this.desctription,
      iconName: iconName ?? this.iconName,
      id: id ?? this.id,
      isCompleteToday: isCompleteToday ?? this.isCompleteToday,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        color,
        desctription,
        iconName,
        overviews,
        isCompleteToday,
      ];
}
