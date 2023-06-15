import "package:isar/isar.dart";
import "package:pomodore/core/resources/params/habit_params.dart";

import "../../utils/utils.dart";
import "collections/habit_collection.dart";

class IsarHelper {
  final Isar isar;

  IsarHelper(this.isar);

  Future<List<HabitCollection>> getAllHabits() async {
    return await isar.habitCollections.where().findAll();
  }

  Future<Id> addHabit(HabitParams params) async {
    final newHabit = HabitCollection()
      ..uuid = params.uuid
      ..habitColor = params.color
      ..habitDescription = params.description
      ..habitIcon = params.icon
      ..habitTitle = params.title
      ..overviews = [];
    return await isar.writeTxn(() async {
      return await isar.habitCollections.put(newHabit);
    });
  }

  Future<void> deleteHabit(Id id) async {
    await isar.writeTxn(() async {
      await isar.habitCollections.delete(id);
    });
  }

  Future<HabitCollection?> getSpecificHabit(Id id) async {
    return await isar.habitCollections.get(id);
  }

  Future<HabitCollection?> updateHabit(HabitParams newHabit) async {
    HabitCollection? habit = await isar.habitCollections.get(newHabit.id!);
    habit?.habitTitle = newHabit.title;
    habit?.habitIcon = newHabit.icon;
    habit?.habitDescription = newHabit.description;
    habit?.habitColor = newHabit.color;
    await isar.writeTxn(() async {
      await isar.habitCollections.put(habit!);
    });
    return habit;
  }

  Future<HabitCollection?> completeHabit(Id id) async {
    HabitCollection? habit = await isar.habitCollections.get(id);
    if (habit == null) return null;
    List<String> newList = habit.overviews?.toList(growable: true) ?? [];
    if (newList.contains(Utils.formatDateToYYYYMMDD(DateTime.now()))) {
      newList.remove(Utils.formatDateToYYYYMMDD(DateTime.now()));
    } else {
      newList.add(Utils.formatDateToYYYYMMDD(DateTime.now()));
    }
    habit.overviews = newList;

    await isar.writeTxn(() async {
      await isar.habitCollections.put(habit);
    });
    return habit;
  }
}
