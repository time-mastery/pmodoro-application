import "../../domain/entities/habit_entity.dart";

class HabitModel extends HabitEntity {
  const HabitModel({
    required Map<DateTime, int> overviews,
    required String title,
    required String id,
    required String desctription,
    required String iconName,
  }) : super(
          overviews: overviews,
          title: title,
          id: id,
          desctription: desctription,
          iconName: iconName,
        );

  factory HabitModel.fromJson(Map json) {
    return HabitModel(
      id: json["habit"]["id"] ?? "",
      overviews: json["overviews"] ?? {},
      title: json["habit"]["habitTitle"] ?? "",
      desctription: json["habit"]["habitDescription"] ?? "",
      iconName: json["habit"]["habitIcon"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "habitTitle": title,
      "habitDescriptino": desctription,
      "habitIcon": iconName,
    };
  }
}
