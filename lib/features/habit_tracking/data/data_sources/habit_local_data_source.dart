import "package:pomodore/core/resources/params/habit_params.dart";
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
        Map<DateTime, int> overviewsMap = {};
        List<Map> overviews =
            await db.rawQuery(habitDetailsQuery, [element["_id"]]);

        for (var element in overviews) {
          String key = element["dateTime"];
          overviewsMap.addAll({DateTime.parse(key): 1});
        }

        result.add({"habit": element, "overviews": overviewsMap});
      }

      return result;
    } catch (e, s) {
      dPrint("$e + $s");
      return null;
    }
  }

  Future<bool> addHabit(HabitParams item) async {
    try {
      await db.insert(
        DatabaseHelper.habitTable,
        HabitModel.toJson(item),
      );
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
