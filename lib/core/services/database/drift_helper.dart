import "dart:convert";

import "package:drift/drift.dart";
import "package:drift/native.dart";

// Replace these imports with your actual parameter classes
import "package:pomodore/core/resources/params/habit_params.dart";
import "package:pomodore/core/resources/params/task_params.dart";
import "package:pomodore/core/resources/params/save_pomodoro_params.dart";

part "drift_helper.g.dart";

class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();

  @override
  List<String> fromSql(String fromDb) {
    final decoded = jsonDecode(fromDb) as List<dynamic>;
    return decoded.map((item) => item as String).toList();
  }

  @override
  String toSql(List<String> value) {
    return jsonEncode(value);
  }
}

// 1) Define your tables
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().nullable()();
}

class DailyGoals extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get count => integer().nullable()();
  TextColumn get goalDateTime => text().nullable()();
}

class Habits extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().nullable()();
  TextColumn get habitTitle => text().nullable()();
  TextColumn get habitDescription => text().nullable()();
  TextColumn get habitIcon => text().nullable()();
  IntColumn get habitColor => integer().nullable()();
  // Store lists as JSON or other encoding if needed:
  TextColumn get overviews =>
      text().map(const StringListConverter()).nullable()();
}

class HabitTrackers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get habitId => text().nullable()();
  TextColumn get creationDateTime => text().nullable()();
}

class Pomodoros extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get taskUid => text().nullable()();
  IntColumn get duration => integer().nullable()();
  TextColumn get creationDateTime => text().nullable()();
}

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uid => text().nullable()();
  TextColumn get title => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get deadLineTime => text().nullable()();
  TextColumn get category => text().nullable()();
  TextColumn get doneTime => text().nullable()();
  BoolColumn get done => boolean().nullable()();
}

// 2) Create your database class
@DriftDatabase(
  tables: [
    Categories,
    DailyGoals,
    Habits,
    HabitTrackers,
    Pomodoros,
    Tasks,
  ],
)
class AppDatabase extends _$AppDatabase {
  // Provide a connection. Example uses in-memory; replace with a real file or sqflite, etc.
  AppDatabase() : super(NativeDatabase.memory());

  @override
  int get schemaVersion => 1;

  /*
  *
  * Habits
  * */
  Future<List<Habit>> getAllHabits() async {
    return select(habits).get();
  }

  Future<Habit?> completeHabit(int id) async {
    // Get the existing habit
    final habit = await getSpecificHabit(id);
    if (habit == null) return null;

    // Extract the existing list or use an empty list
    final overviewsList = List<String>.from(habit.overviews ?? []);

    // Toggle today's date
    final today = DateTime.now().toString();
    if (overviewsList.contains(today)) {
      overviewsList.remove(today);
    } else {
      overviewsList.add(today);
    }

    // Write updates back to the database
    await (update(habits)..where((tbl) => tbl.id.equals(id))).write(
      HabitsCompanion(overviews: Value(overviewsList)),
    );

    // Return the updated row
    return getSpecificHabit(id);
  }

  Future<int> addHabit(HabitParams params) async {
    return into(habits).insert(HabitsCompanion.insert(
      uuid: Value(params.uuid),
      habitColor: Value(params.color),
      habitDescription: Value(params.description),
      habitIcon: Value(params.icon),
      habitTitle: Value(params.title),
      overviews: Value(null), // Convert List<String> -> JSON if needed
    ));
  }

  Future<int> deleteHabit(int id) async {
    return (delete(habits)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<Habit?> getSpecificHabit(int id) async {
    return (select(habits)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  Future<Habit?> updateHabit(HabitParams params) async {
    // Perform the update
    await (update(habits)..where((tbl) => tbl.id.equals(params.id!))).write(
      HabitsCompanion(
        habitTitle: Value(params.title),
        habitIcon: Value(params.icon),
        habitDescription: Value(params.description),
        habitColor: Value(params.color),
      ),
    );
    // Return the updated row
    return getSpecificHabit(params.id!);
  }

  /*
  *
  * Tasks
  * */
  Future<Task?> addTask(TaskParams params) async {
    final result = await into(tasks).insert(TasksCompanion.insert(
      uid: Value(params.uid),
      title: Value(params.taskTitle),
      description: Value(params.taskDescription),
      deadLineTime: Value(params.taskDateTimeDeadline?.toString()),
      doneTime: Value(params.taskDoneDatetime?.toString()),
      done: const Value(false),
      category: const Value(null),
    ));
    return getTaskByUid(result.toString());
  }

  Future<Task?> editTask(TaskParams task) async {
    await (update(tasks)..where((tbl) => tbl.id.equals(task.id!))).write(
      TasksCompanion(
        title: Value(task.taskTitle),
        description: Value(task.taskDescription),
        done: Value(task.taskDone),
        // Add other fields you wish to modify
      ),
    );
    // Return the updated row
    return (select(tasks)..where((tbl) => tbl.id.equals(task.id!)))
        .getSingleOrNull();
  }

  Future<int> deleteTask(int id) async {
    return (delete(tasks)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<List<Task>> getUnCompletedTasks() async {
    return (select(tasks)..where((tbl) => tbl.done.equals(false))).get();
  }

  Future<List<Task>> getAllTasks() async {
    return select(tasks).get();
  }

  Future<List<Task>> getSpecificDateTasks(DateTime date) async {
    final filterDate = date.toString();
    return (select(tasks)..where((tbl) => tbl.deadLineTime.equals(filterDate)))
        .get();
  }

  Future<int> getAllTodayTaskQuantity() async {
    final today = DateTime.now().toString();
    final items = await (select(tasks)
          ..where((tbl) => tbl.deadLineTime.equals(today)))
        .get();
    return items.length;
  }

  Future<int> getCompletedTaskQuantity() async {
    final today = DateTime.now().toString();
    final items = await (select(tasks)
          ..where((tbl) => tbl.deadLineTime.equals(today))
          ..where((tbl) => tbl.done.equals(true)))
        .get();
    return items.length;
  }

  Future<Task?> getTaskByUid(String uid) async {
    return (select(tasks)..where((tbl) => tbl.uid.equals(uid)))
        .getSingleOrNull();
  }

  /*
  *
  * Pomodoro
  * */
  Future<List<Pomodoro>> getAllPomodoros() async {
    return select(pomodoros).get();
  }

  Future<List<Pomodoro>> getAllTodayPomodoros() async {
    final today = DateTime.now().toString();
    return (select(pomodoros)
          ..where((tbl) => tbl.creationDateTime.equals(today)))
        .get();
  }

  Future<List<Pomodoro>> getSpecificDatePomodoros(DateTime date) async {
    final filterDate = date.toString();
    return (select(pomodoros)
          ..where((tbl) => tbl.creationDateTime.equals(filterDate)))
        .get();
  }

  Future<int> saveAPomodoro(SavePomodoroParams item) async {
    // Convert your item.entity.dateTime to string if needed
    return into(pomodoros).insert(PomodorosCompanion.insert(
      creationDateTime: Value(item.entity.dateTime.toString()),
      taskUid: Value(item.entity.taskUid),
      duration: Value(item.entity.duration),
    ));
  }

  /*
  *
  * Daily Goal
  * */
  Future<void> saveDailyGoal(int count) async {
    await into(dailyGoals).insert(DailyGoalsCompanion.insert(
      count: Value(count),
      goalDateTime: Value(DateTime.now().toString()),
    ));
  }

  Future<int?> getDailyGoalQuantity() async {
    final today = DateTime.now().toString();
    final items = await (select(dailyGoals)
          ..where((tbl) => tbl.goalDateTime.equals(today)))
        .get();
    return items.isNotEmpty ? items.first.count : null;
  }

  Future<bool> checkDailyGoal() async {
    final today = DateTime.now().toString();
    final items = await (select(dailyGoals)
          ..where((tbl) => tbl.goalDateTime.equals(today)))
        .get();
    return items.isNotEmpty;
  }
}
