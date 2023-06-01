import "../../../../core/resources/params/habit_params.dart";
import "../../domain/entities/habit_entity.dart";

class HabitModel extends HabitEntity {
  const HabitModel({
    required Map<DateTime, int> overviews,
    required String title,
    required String id,
    required String desctription,
    required String iconName,
    required int color,
  }) : super(
          overviews: overviews,
          title: title,
          id: id,
          desctription: desctription,
          iconName: iconName,
          color: color,
        );

  factory HabitModel.fromJson(Map json) {
    return HabitModel(
      id: json["habit"]["id"] ?? "",
      color: json["habit"]["habitColor"] ?? 0,
      overviews: json["overviews"] ?? {},
      title: json["habit"]["habitTitle"] ?? "",
      desctription: json["habit"]["habitDescription"] ?? "",
      iconName: json["habit"]["habitIcon"] ?? "",
    );
  }

  static Map<String, dynamic> toJson(HabitParams item) {
    return {
      "habitTitle": item.title,
      "habitDescription": item.description,
      "habitIcon": item.icon,
      "habitColor": item.color,
    };
  }
}
