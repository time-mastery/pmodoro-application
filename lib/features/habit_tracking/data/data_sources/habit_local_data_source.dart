import "package:pomodore/core/resources/params/habit_params.dart";
import "package:pomodore/core/services/database/database_helper.dart";
import "package:pomodore/core/utils/debug_print.dart";
import "package:pomodore/features/habit_tracking/data/models/habit_model.dart";
import "package:pomodore/features/habit_tracking/domain/entities/habit_entity.dart";
import "package:sqflite/sqflite.dart";

import "../../../../core/utils/utils.dart";

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

  Future<bool> deleteHabit(int id) async {
    try {
      await db.delete(
        DatabaseHelper.habitTable,
        where: "_id = ?",
        whereArgs: [id],
      );

      return true;
    } catch (e, s) {
      dPrint("$e     $s");

      return false;
    }
  }

  Future<Map?> getSpecificHabit(int id) async {
    try {
      const query = "SELECT * FROM ${DatabaseHelper.habitTable} WHERE _id = ?";
      const habitDetailsQuery =
          "SELECT * FROM ${DatabaseHelper.habitTrackingTable} WHERE habitId == ?";

      List<Map> habit = await db.rawQuery(query, [id]);

      Map<DateTime, int> overviewsMap = {};
      List<Map> overviews = await db.rawQuery(habitDetailsQuery, [id]);

      for (var element in overviews) {
        String key = element["dateTime"];
        overviewsMap.addAll({DateTime.parse(key): 1});
      }

      return {
        "habit": habit.first,
        "overviews": overviewsMap,
      };
    } catch (e, s) {
      dPrint("$e  $s");

      return null;
    }
  }

  Future<Map?> editHabit(HabitParams newHabit) async {
    try {
      await db.update(
        DatabaseHelper.habitTable,
        {
          "habitTitle": newHabit.title,
          "habitDescription": newHabit.description,
          "habitIcon": newHabit.icon,
          "habitColor": newHabit.color,
        },
        where: "_id = ?",
        whereArgs: [newHabit.id],
      );

      return await getSpecificHabit(newHabit.id!);
    } catch (e, s) {
      dPrint("$e  $s");
      return null;
    }
  }

  Future<Map?> completeHabit(HabitOverviewParams params) async {
    try {
      if (params.completedToday) {
        await db.delete(
          DatabaseHelper.habitTrackingTable,
          where: "dateTime = ?",
          whereArgs: [Utils.formatDateToYYYYMMDD(DateTime.now())],
        );
      } else {
        await db.insert(DatabaseHelper.habitTrackingTable, {
          "habitId": params.id,
          "dateTime": Utils.formatDateToYYYYMMDD(DateTime.now()),
        });
      }

      return await getSpecificHabit(params.id);
    } catch (e, s) {
      dPrint("$e     $s");

      return null;
    }
  }
}
