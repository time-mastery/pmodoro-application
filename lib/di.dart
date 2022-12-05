import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pomodore/core/utils/database_helper.dart';
import 'package:pomodore/core/utils/ticker.dart';
import 'package:pomodore/features/task_management/presentation/blocs/timer_bloc/timer_bloc.dart';
import 'package:sqflite/sqflite.dart';

final getIt = GetIt.instance;

Future inject() async {
  await Hive.initFlutter();
  Box appBox = await Hive.openBox('app_box');

  getIt.registerLazySingleton<Box>(
    () => appBox,
    dispose: (param) => param.close(),
  );

  Database db = await DatabaseHelper.database;
  getIt.registerSingleton<Database>(db);

  // inject blocs
  getIt.registerSingleton<TimerBloc>(TimerBloc(ticker: const Ticker()));
}
