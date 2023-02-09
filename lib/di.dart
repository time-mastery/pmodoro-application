import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pomodore/core/utils/database_helper.dart';
import 'package:pomodore/core/utils/storage.dart';
import 'package:pomodore/features/configuration/data/data_sources/settings_local_data_source.dart';
import 'package:pomodore/features/configuration/data/repositories/settings_repository_impl.dart';
import 'package:pomodore/features/configuration/domain/repositories/settings_repository.dart';
import 'package:pomodore/features/configuration/domain/usecases/change_settings_usecase.dart';
import 'package:pomodore/features/configuration/domain/usecases/get_settings_usecase.dart';
import 'package:pomodore/features/configuration/presentation/blocs/base_bloc/base_bloc.dart';
import 'package:pomodore/features/configuration/presentation/blocs/settings_bloc/settings_bloc.dart';
import 'package:pomodore/features/task_management/data/repositories/category_repository_impl.dart';
import 'package:pomodore/features/task_management/data/repositories/task_repository_impl.dart';
import 'package:pomodore/features/task_management/domain/repositories/task_repository.dart';
import 'package:pomodore/features/task_management/domain/usecases/add_category_usecase.dart';
import 'package:pomodore/features/task_management/domain/usecases/add_pomodoro_to_db_usecase.dart';
import 'package:pomodore/features/task_management/domain/usecases/add_task_usecase.dart';
import 'package:pomodore/features/task_management/domain/usecases/complete_task_usecase.dart';
import 'package:pomodore/features/task_management/domain/usecases/delete_task_usecase.dart';
import 'package:pomodore/features/task_management/domain/usecases/get_all_categories_usecase.dart';
import 'package:pomodore/features/task_management/domain/usecases/get_daily_information_usecase.dart';
import 'package:pomodore/features/task_management/domain/usecases/get_specific_date_tasks_usecase.dart';
import 'package:pomodore/features/task_management/domain/usecases/get_today_pomodoros_usecase.dart';
import 'package:pomodore/features/task_management/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:pomodore/features/task_management/presentation/blocs/tasks_bloc/tasks_bloc.dart';
import 'package:pomodore/features/task_management/presentation/blocs/timer_bloc/timer_bloc.dart';
import 'package:sqflite/sqflite.dart';

import 'core/utils/ticker.dart';
import 'features/task_management/data/data_sources/tasks_local_data_source.dart';
import 'features/task_management/domain/repositories/category_repository.dart';
import 'features/task_management/domain/usecases/get_today_tasks_usecase.dart';

final getIt = GetIt.instance;

Future inject() async {
  // inject databases
  await Hive.initFlutter();
  Box appBox = await Hive.openBox('app_box');

  getIt.registerLazySingleton<Box>(
    () => appBox,
    dispose: (param) => param.close(),
  );

  FStorage.initialize();

  Database db = await DatabaseHelper.database;
  getIt.registerSingleton<Database>(db);

  // inject ticker
  Ticker ticker = const Ticker();
  getIt.registerSingleton<Ticker>(ticker);

  // inject datasource
  getIt.registerSingleton<TasksLocalDataSource>(TasksLocalDataSource(getIt()));
  getIt.registerSingleton<SettingsLocalDataSources>(SettingsLocalDataSources());

  // inject repositories
  getIt.registerSingleton<TaskRepository>(TaskRepositoryImpl(getIt()));
  getIt.registerSingleton<CategoryRepository>(CategoryRepositoryImpl(getIt()));
  getIt.registerSingleton<SettingsRepository>(SettingsRepositoryImpl(getIt()));

  // inject use-cases
  getIt.registerSingleton<AddTaskUsecase>(AddTaskUsecase(getIt()));
  getIt.registerSingleton<AddCategoryUsecase>(AddCategoryUsecase(getIt()));
  getIt.registerSingleton<GetSpecificDateTasksUseCase>(
      GetSpecificDateTasksUseCase(getIt()));
  getIt.registerSingleton<GetAllCategoriesUseCase>(
      GetAllCategoriesUseCase(getIt()));
  getIt.registerSingleton<CompleteTaskUseCase>(CompleteTaskUseCase(getIt()));
  getIt.registerSingleton<DeleteTaskUseCase>(DeleteTaskUseCase(getIt()));
  getIt.registerSingleton<AddPomodoroToDbUseCase>(
      AddPomodoroToDbUseCase(getIt()));
  getIt.registerSingleton<GetTodayPomodorosUseCase>(
      GetTodayPomodorosUseCase(getIt()));
  getIt.registerSingleton<GetSettingsUseCase>(GetSettingsUseCase(getIt()));
  getIt
      .registerSingleton<ChangeSettingsUseCase>(ChangeSettingsUseCase(getIt()));
  getIt.registerSingleton<GetDailyInformationUseCase>(
      GetDailyInformationUseCase(getIt()));
  getIt.registerSingleton<GetTodayTasksUseCase>(GetTodayTasksUseCase(getIt()));

  // inject blocs
  // global bloc
  getIt.registerSingleton<TimerBloc>(TimerBloc(ticker: getIt()));
  getIt.registerSingleton<BaseBloc>(BaseBloc());
  getIt.registerSingleton<SettingsBloc>(
      SettingsBloc(getSettingUseCase: getIt(), changeSettingsUseCase: getIt()));
  // local bloc
  getIt.registerFactory<TasksBloc>(() => TasksBloc(
        addTaskUsecase: getIt(),
        addCategoryUsecase: getIt(),
        getSpecificDateTasks: getIt(),
        getAllCategories: getIt(),
        completeTaskUseCase: getIt(),
        deleteTaskUseCase: getIt(),
        addPomodoroToDbUseCase: getIt(),
      ));

  getIt.registerFactory<SettingsBloc>(() => SettingsBloc(
        getSettingUseCase: getIt(),
        changeSettingsUseCase: getIt(),
      ));

  getIt.registerFactory<HomeBloc>(() => HomeBloc(
        getDailyInformationUseCase: getIt(),
        getTodayTasksUseCase: getIt(),
      ));
}
