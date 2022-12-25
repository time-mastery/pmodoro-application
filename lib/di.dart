import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pomodore/core/utils/database_helper.dart';
import 'package:pomodore/features/configuration/presentation/blocs/base_bloc/base_bloc.dart';
import 'package:pomodore/features/task_management/data/repositories/category_repository_impl.dart';
import 'package:pomodore/features/task_management/data/repositories/task_repository_impl.dart';
import 'package:pomodore/features/task_management/domain/repositories/task_repository.dart';
import 'package:pomodore/features/task_management/domain/usecases/add_category_usecase.dart';
import 'package:pomodore/features/task_management/domain/usecases/add_task_usecase.dart';
import 'package:pomodore/features/task_management/domain/usecases/get_all_categories.dart';
import 'package:pomodore/features/task_management/domain/usecases/get_specific_date_tasks.dart';
import 'package:pomodore/features/task_management/presentation/blocs/timer_bloc/timer_bloc.dart';
import 'package:sqflite/sqflite.dart';

import 'core/utils/ticker.dart';
import 'features/task_management/data/data_sources/tasks_local_data_source.dart';
import 'features/task_management/domain/repositories/category_repository.dart';

final getIt = GetIt.instance;

Future inject() async {
  // inject databases
  await Hive.initFlutter();
  Box appBox = await Hive.openBox('app_box');

  getIt.registerLazySingleton<Box>(
    () => appBox,
    dispose: (param) => param.close(),
  );

  Database db = await DatabaseHelper.database;
  getIt.registerSingleton<Database>(db);

  // inject ticker
  Ticker ticker = const Ticker();
  getIt.registerSingleton<Ticker>(ticker);

  // inject datasource
  getIt.registerSingleton<TasksLocalDataSource>(TasksLocalDataSource(getIt()));

  // inject repositories
  getIt.registerSingleton<TaskRepository>(TaskRepositoryImpl(getIt()));
  getIt.registerSingleton<CategoryRepository>(CategoryRepositoryImpl(getIt()));

  // inject use-cases
  getIt.registerSingleton<AddTaskUsecase>(AddTaskUsecase(getIt()));
  getIt.registerSingleton<AddCategoryUsecase>(AddCategoryUsecase(getIt()));
  getIt.registerSingleton<GetSpecificDateTasks>(GetSpecificDateTasks(getIt()));
  getIt.registerSingleton<GetAllCategories>(GetAllCategories(getIt()));

  // inject global blocs
  getIt.registerSingleton<TimerBloc>(TimerBloc(ticker: getIt()));
  getIt.registerSingleton<BaseBloc>(BaseBloc());
}
