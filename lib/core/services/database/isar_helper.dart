import "package:isar/isar.dart";
import "package:pomodore/core/resources/params/habit_params.dart";
import "package:pomodore/core/resources/params/save_pomodoro_params.dart";
import "package:pomodore/core/resources/params/task_params.dart";
import "package:pomodore/core/services/database/collections/pomodoro_collection.dart";
import "package:uuid/uuid.dart";

import "../../utils/utils.dart";
import "collections/daily_goal_collection.dart";
import "collections/habit_collection.dart";
import "collections/task_collection.dart";

class IsarHelper {
  final Isar isar;

  IsarHelper(this.isar);

  /*
  *
  * Habits
  * */

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

  /*
  *
  * Tasks
  * */

  Future<TaskCollection?> addTask(TaskParams params) async {
    TaskCollection? taskCollection = TaskCollection()
      ..title = params.taskTitle
      ..description = params.taskDescription
      ..deadLineTime = params.taskDateTimeDeadline
      ..doneTime = params.taskDoneDatetime
      ..uid = const Uuid().v4()
      ..done = false;

    return await isar.writeTxn(() async {
      Id id = await isar.taskCollections.put(taskCollection);
      return await isar.taskCollections.get(id);
    });
  }

  Future<TaskCollection?> editTask(TaskParams task) async {
    TaskCollection? item = await isar.taskCollections.get(task.id!);
    if (item == null) return item;
    item.title = task.taskTitle;
    item.description = task.taskDescription;
    item.done = task.taskDone;
    await isar.writeTxn(() async {
      isar.taskCollections.put(item);
    });
    return item;
  }

  Future<void> deleteTask(Id id) async {
    await isar.writeTxn(() async {
      await isar.taskCollections.delete(id);
    });
  }

  Future<List<TaskCollection>> getUnCompletedTasks() async {
    return await isar.taskCollections.filter().doneEqualTo(false).findAll();
  }

  Future<List<TaskCollection>> getAllTasks() async {
    return await isar.taskCollections.where().findAll();
  }

  Future<List<TaskCollection>> getSpecificDateTasks(DateTime date) async {
    return await isar.taskCollections
        .filter()
        .deadLineTimeEqualTo(Utils.formatDateToYYYYMMDD(date))
        .findAll();
  }

  Future<int> getAllTodayTaskQuantity() async {
    List items = await isar.taskCollections
        .filter()
        .deadLineTimeEqualTo(Utils.formatDateToYYYYMMDD(DateTime.now()))
        .findAll();

    return items.length;
  }

  Future<int> getCompletedTaskQuantity() async {
    List items =
        await isar.taskCollections.filter().doneEqualTo(true).findAll();

    return items.length;
  }

  Future<TaskCollection?> getTaskByUId(String uid) async {
    List list = await isar.taskCollections.filter().uidEqualTo(uid).findAll();
    return list.first;
  }

  /*
  *
  * Pomodoro
  * */

  Future<List<PomodoroCollection>> getAllPomodoros() async {
    return await isar.pomodoroCollections.where().findAll();
  }

  Future<List<PomodoroCollection>> getAllTodayPomodoros() async {
    return await isar.pomodoroCollections
        .filter()
        .dateTimeEqualTo(Utils.formatDateToYYYYMMDD(DateTime.now()))
        .findAll();
  }

  Future<Id?> saveAPomodoro(SavePomodoroParams item) async {
    PomodoroCollection pomodoroCollection = PomodoroCollection()
      ..dateTime = item.entity.dateTime
      ..taskUid = item.entity.taskUid
      ..duration = item.entity.duration;
    return await isar.writeTxn(() async {
      return await isar.pomodoroCollections.put(pomodoroCollection);
    });
  }

/*
  *
  * Daily Goal
  * */

  Future<void> saveDailyGoal(int count) async {
    DailyGoalCollection item = DailyGoalCollection()
      ..dateTime = Utils.formatDateToYYYYMMDD(DateTime.now())
      ..count = count;

    await isar.writeTxn(() async {
      await isar.dailyGoalCollections.put(item);
    });
  }

  Future<int?> getDailyGoalQuantity() async {
    List<DailyGoalCollection> items = await isar.dailyGoalCollections
        .filter()
        .dateTimeEqualTo(Utils.formatDateToYYYYMMDD(DateTime.now()))
        .findAll();

    return items.first.count;
  }

  Future<bool> checkDailyGoal() async {
    List<DailyGoalCollection> items = await isar.dailyGoalCollections
        .filter()
        .dateTimeEqualTo(Utils.formatDateToYYYYMMDD(DateTime.now()))
        .findAll();
    return items.isNotEmpty;
  }
}
