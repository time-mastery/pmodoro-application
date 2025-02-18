import "package:isar/isar.dart";

// part "habit_collection.g.dart";

// @collection
// class HabitCollection {
//   Id id = Isar.autoIncrement;
//   String? uuid;
//   String? habitTitle;
//   String? habitDescription;
//   String? habitIcon;
//   int? habitColor;
//   List<String>? overviews;
// }

class HabitCollection {
  final int id;
  final String? uuid;
  final String? habitTitle;
  final String? habitDescription;
  final String? habitIcon;
  final int? habitColor;
  final List<String>? overviews;

  HabitCollection(
      {required this.id,
      required this.uuid,
      required this.habitTitle,
      required this.habitDescription,
      required this.habitIcon,
      required this.habitColor,
      required this.overviews});
}
