import "../../../../core/resources/params/habit_params.dart";
import "../../../../core/utils/utils.dart";
import "../../domain/entities/habit_entity.dart";

class HabitModel extends HabitEntity {
  const HabitModel({
    required Map<DateTime, int> overviews,
    required String title,
    required int id,
    required String desctription,
    required String iconName,
    required int color,
    required bool isCompleteToday,
  }) : super(
          overviews: overviews,
          title: title,
          id: id,
          desctription: desctription,
          iconName: iconName,
          color: color,
          isCompleteToday: isCompleteToday,
        );

  factory HabitModel.fromJson(Map json) {
    final overviews = json["overviews"] as Map<DateTime, int>;
    final completed =
        overviews.keys.any((element) => Utils.checkDateIsToday(element));

    return HabitModel(
      id: json["habit"]["_id"] ?? 0,
      color: json["habit"]["habitColor"] ?? 0,
      overviews: json["overviews"] ?? {},
      title: json["habit"]["habitTitle"] ?? "",
      desctription: json["habit"]["habitDescription"] ?? "",
      iconName: json["habit"]["habitIcon"] ?? "",
      isCompleteToday: completed,
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
