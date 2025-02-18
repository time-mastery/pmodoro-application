import "package:isar/isar.dart";
import "package:pomodore/core/resources/params/habit_params.dart";
import "package:pomodore/core/resources/params/save_pomodoro_params.dart";
import "package:pomodore/core/resources/params/task_params.dart";
import "package:pomodore/core/services/database/collections/pomodoro_collection.dart";
import "package:pomodore/core/utils/debug_print.dart";
import "package:uuid/uuid.dart";

import "../../utils/utils.dart";
import "collections/daily_goal_collection.dart";
import "collections/habit_collection.dart";
import "collections/task_collection.dart";

class IsarHelper {
  /*
  *
  * Habits
  * */

  Future<List<HabitCollection>> getAllHabits() async {
    // return await isar.habitCollections.where().findAll();
    return [];
  }

  Future<Id> addHabit(HabitParams params) async {
    // final newHabit = HabitCollection()
    //   ..uuid = params.uuid
    //   ..habitColor = params.color
    //   ..habitDescription = params.description
    //   ..habitIcon = params.icon
    //   ..habitTitle = params.title
    //   ..overviews = [];
    // return await isar.writeTxn(() async {
    //   return await isar.habitCollections.put(newHabit);
    // });
    return 1;
  }

  Future<void> deleteHabit(Id id) async {
    // await isar.writeTxn(() async {
    //   await isar.habitCollections.delete(id);
    // });
    return Future.value();
  }

  Future<HabitCollection?> getSpecificHabit(Id id) async {
    // return await isar.habitCollections.get(id);
    return null;
  }

  Future<HabitCollection?> updateHabit(HabitParams newHabit) async {
    // HabitCollection? habit = await isar.habitCollections.get(newHabit.id!);
    // habit.habitTitle = newHabit.title;
    // habit.habitIcon = newHabit.icon;
    // habit.habitDescription = newHabit.description;
    // habit.habitColor = newHabit.color;
    // await isar.writeTxn(() async {
    //   await isar.habitCollections.put(habit);
    // });
    // return habit;
    return null;
  }

  Future<HabitCollection?> completeHabit(Id id) async {
    return null;
    // HabitCollection? habit = await isar.habitCollections.get(id);
    // List<String> newList = habit.overviews?.toList(growable: true) ?? [];
    // if (newList.contains(Utils.formatDateToYYYYMMDD(DateTime.now()))) {
    //   newList.remove(Utils.formatDateToYYYYMMDD(DateTime.now()));
    // } else {
    //   newList.add(Utils.formatDateToYYYYMMDD(DateTime.now())!);
    // }
    // habit.overviews = newList;

    // await isar.writeTxn(() async {
    //   await isar.habitCollections.put(habit);
    // });
    // return habit;
  }

  /*
  *
  * Tasks
  * */

  Future<TaskCollection?> addTask(TaskParams params) async {
    return null;
    // TaskCollection? taskCollection = TaskCollection()
    //   ..title = params.taskTitle
    //   ..description = params.taskDescription
    //   ..deadLineTime = params.taskDateTimeDeadline == null
    //       ? null
    //       : Utils.formatDateToYYYYMMDD(params.taskDateTimeDeadline!)
    //   ..doneTime = params.taskDoneDatetime == null
    //       ? null
    //       : Utils.formatDateToYYYYMMDD(params.taskDoneDatetime!)
    //   ..uid = const Uuid().v4()
    //   ..done = false;

    // return await isar.writeTxn(() async {
    //   Id id = await isar.taskCollections.put(taskCollection);
    //   return await isar.taskCollections.get(id);
    // });
  }

  Future<TaskCollection?> editTask(TaskParams task) async {
    // try {
    //   TaskCollection? item = await isar.taskCollections.get(task.id!);
    //   item.title = task.taskTitle;
    //   item.description = task.taskDescription;
    //   item.done = task.taskDone;
    //   await isar.writeTxn(() async {
    //     isar.taskCollections.put(item);
    //   });
    //   return item;
    // } catch (e, s) {
    //   dPrint(e);
    //   dPrint(s);
    //   return Future.error(e);
    // }

    return null;
  }

  Future<void> deleteTask(Id id) async {
    // await isar.writeTxn(() async {
    //   await isar.taskCollections.delete(id);
    // });

    return Future.value();
  }

  Future<List<TaskCollection>> getUnCompletedTasks() async {
    // return await isar.taskCollections.filter().doneEqualTo(false).findAll();
    return [];
  }

  Future<List<TaskCollection>> getAllTasks() async {
    // return await isar.taskCollections.where().findAll();
    return [];
  }

  Future<List<TaskCollection>> getSpecificDateTasks(DateTime date) async {
    // return await isar.taskCollections
    //     .filter()
    //     .deadLineTimeEqualTo(Utils.formatDateToYYYYMMDD(date))
    //     .findAll();

    return [];
  }

  Future<int> getAllTodayTaskQuantity() async {
    // List items = await isar.taskCollections
    //     .filter()
    //     .deadLineTimeEqualTo(Utils.formatDateToYYYYMMDD(DateTime.now()))
    //     .findAll();

    // return items.length;
    return 1;
  }

  Future<int> getCompletedTaskQuantity() async {
    // List items = await isar.taskCollections
    //     .filter()
    //     .deadLineTimeEqualTo(Utils.formatDateToYYYYMMDD(DateTime.now()))
    //     .doneEqualTo(true)
    //     .findAll();

    // return items.length;

    return 1;
  }

  Future<TaskCollection?> getTaskByUId(String uid) async {
    // List list = await isar.taskCollections.filter().uidEqualTo(uid).findAll();
    // return list.first;

    return null;
  }

  /*
  *
  * Pomodoro
  * */

  Future<List<PomodoroCollection>> getAllPomodoros() async {
    // return await isar.pomodoroCollections.where().findAll();
    return [];
  }

  Future<List<PomodoroCollection>> getAllTodayPomodoros() async {
    // try {
    //   return await isar.pomodoroCollections
    //       .filter()
    //       .dateTimeEqualTo(Utils.formatDateToYYYYMMDD(DateTime.now()))
    //       .findAll();
    // } catch (e) {
    //   return Future.error(e);
    // }
    return [];
  }

  Future<List<PomodoroCollection>> getSpecificDatePomodoros(
      DateTime date) async {
    // return await isar.pomodoroCollections
    //     .filter()
    //     .dateTimeEqualTo(Utils.formatDateToYYYYMMDD(date))
    //     .findAll();
    return [];
  }

  Future<Id?> saveAPomodoro(SavePomodoroParams item) async {
    // PomodoroCollection pomodoroCollection = PomodoroCollection()
    //   ..dateTime = Utils.formatDateToYYYYMMDD(item.entity.dateTime)
    //   ..taskUid = item.entity.taskUid
    //   ..duration = item.entity.duration;
    // return await isar.writeTxn(() async {
    //   return await isar.pomodoroCollections.put(pomodoroCollection);
    // });

    return 1;
  }

/*
  *
  * Daily Goal
  * */

  Future<void> saveDailyGoal(int count) async {
    // DailyGoalCollection item = DailyGoalCollection()
    //   ..dateTime = Utils.formatDateToYYYYMMDD(DateTime.now())
    //   ..count = count;

    // await isar.writeTxn(() async {
    //   await isar.dailyGoalCollections.put(item);
    // });

    return Future.value();
  }

  Future<int?> getDailyGoalQuantity() async {
    // List<DailyGoalCollection> items = await isar.dailyGoalCollections
    //     .filter()
    //     .dateTimeEqualTo(Utils.formatDateToYYYYMMDD(DateTime.now()))
    //     .findAll();

    // return items.first.count;
    return 2;
  }

  Future<bool> checkDailyGoal() async {
    // List<DailyGoalCollection> items = await isar.dailyGoalCollections
    //     .filter()
    //     .dateTimeEqualTo(Utils.formatDateToYYYYMMDD(DateTime.now()))
    //     .findAll();
    // return items.isNotEmpty;
    return false;
  }
}
