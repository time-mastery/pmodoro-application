import "../../domain/entities/habit_entity.dart";

class HabitModel extends HabitEntity {
  const HabitModel({
    required Map<DateTime, int> overviews,
    required String title,
    required String desctription,
    required String iconName,
  }) : super(
          overviews: overviews,
          title: title,
          desctription: desctription,
          iconName: iconName,
        );

  factory HabitModel.fromJson(Map<String, dynamic> json) {
    return HabitModel(
      overviews: json["overviews"] ?? {},
      title: json["title"] ?? "",
      desctription: json["desctription"] ?? "",
      iconName: json["iconName"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "overviews": overviews,
      "title": title,
      "desctription": desctription,
      "iconName": iconName,
    };
  }
}
