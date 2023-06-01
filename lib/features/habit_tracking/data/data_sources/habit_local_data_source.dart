import "package:pomodore/core/services/database/database_helper.dart";
import "package:pomodore/core/utils/debug_print.dart";
import "package:pomodore/features/habit_tracking/data/models/habit_model.dart";
import "package:sqflite/sqflite.dart";

class HabitLocalDataSource {
  final Database db;

  HabitLocalDataSource(this.db);

  Future<List<Map>?> getAllHabits() async {
    List<Map> result = [];
    try {
      const habitQuery = "SELECT * FROM ${DatabaseHelper.habitTable}";
      const habitDetailsQuery =
          "SELECT * FROM ${DatabaseHelper.habitTrackingTable} WHERE habitId == ?";
      List<Map> data = await db.rawQuery(habitQuery);

      for (var element in data) {
        List<Map> overviews =
            await db.rawQuery(habitDetailsQuery, [element["_id"]]);

        result.add({"habit": element, "overviews": overviews});
      }

      return result;
    } catch (e, s) {
      dPrint("$e + $s");
      return null;
    }
  }

  Future<bool> addHabit(HabitModel item) async {
    try {
      await db.insert(DatabaseHelper.habitTable, item.toJson());
      return true;
    } catch (e, s) {
      dPrint("$e     $s");

      return false;
    }
  }

  Future<bool> deleteHabit(String id) async {
    try {
      const query = "";
      await db.delete(DatabaseHelper.habitTrackingTable);

      return true;
    } catch (e, s) {
      dPrint("$e     $s");

      return false;
    }
  }
}
