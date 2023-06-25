import "package:pomodore/core/resources/params/habit_params.dart";
import "package:pomodore/core/services/database/collections/habit_collection.dart";
import "package:pomodore/core/services/database/isar_helper.dart";
import "package:pomodore/core/utils/debug_print.dart";
import "package:pomodore/features/habit_tracking/data/models/habit_model.dart";

class HabitLocalDataSource {
  final IsarHelper db;

  HabitLocalDataSource(this.db);

  Future<List<HabitModel>?> getAllHabits() async {
    try {
      List<HabitCollection?> habits = await db.getAllHabits();

      return habits.map((e) => HabitModel.collectionToModel(e!)).toList();
    } catch (e, s) {
      dPrint("$e + $s");
      return null;
    }
  }

  Future<int?> addHabit(HabitParams item) async {
    try {
      int? id = await db.addHabit(item);
      return id;
    } catch (e, s) {
      dPrint("$e     $s");

      return null;
    }
  }

  Future<void> deleteHabit(int id) async {
    try {
      await db.deleteHabit(id);
    } catch (e, s) {
      dPrint("$e     $s");
      Future.error(e);
    }
  }

  Future<HabitModel?> getSpecificHabit(int id) async {
    try {
      HabitCollection? habit = await db.getSpecificHabit(id);

      return habit == null ? null : HabitModel.collectionToModel(habit);
    } catch (e, s) {
      dPrint("$e  $s");

      return null;
    }
  }

  Future<HabitModel?> editHabit(HabitParams newHabit) async {
    try {
      HabitCollection? habit = await db.updateHabit(newHabit);

      return habit == null ? null : HabitModel.collectionToModel(habit);
    } catch (e, s) {
      dPrint("$e  $s");
      return null;
    }
  }

  Future<HabitModel?> completeHabit(int id) async {
    try {
      HabitCollection? habit = await db.completeHabit(id);
      return habit == null ? null : HabitModel.collectionToModel(habit);
    } catch (e, s) {
      dPrint("$e     $s");

      return null;
    }
  }
}
