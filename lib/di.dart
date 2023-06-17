import "package:audioplayers/audioplayers.dart";
import "package:get_it/get_it.dart";
import "package:isar/isar.dart";
import "package:path_provider/path_provider.dart";
import "package:pomodore/core/services/audio/audio_service.dart";
import "package:pomodore/core/services/database/collections/category_collection.dart";
import "package:pomodore/core/services/database/collections/daily_goal_collection.dart";
import "package:pomodore/core/services/database/collections/habit_collection.dart";
import "package:pomodore/core/services/database/collections/habit_tracker_collection.dart";
import "package:pomodore/core/services/database/collections/task_collection.dart";
import "package:pomodore/core/services/notification/local_notification.dart";
import "package:pomodore/features/configuration/data/data_sources/settings_local_data_source.dart";
import "package:pomodore/features/configuration/data/repositories/settings_repository_impl.dart";
import "package:pomodore/features/configuration/domain/repositories/settings_repository.dart";
import "package:pomodore/features/configuration/domain/usecases/change_locale_usecase.dart";
import "package:pomodore/features/configuration/domain/usecases/change_settings_usecase.dart";
import "package:pomodore/features/configuration/domain/usecases/change_theme_usecase.dart";
import "package:pomodore/features/configuration/domain/usecases/get_locale_usecase.dart";
import "package:pomodore/features/configuration/domain/usecases/get_settings_usecase.dart";
import "package:pomodore/features/configuration/domain/usecases/get_theme_usecase.dart";
import "package:pomodore/features/configuration/presentation/blocs/base_bloc/base_bloc.dart";
import "package:pomodore/features/configuration/presentation/blocs/settings_bloc/settings_bloc.dart";
import "package:pomodore/features/habit_tracking/data/data_sources/habit_local_data_source.dart";
import "package:pomodore/features/habit_tracking/data/repositories/habit_tracking_repository_impl.dart";
import "package:pomodore/features/habit_tracking/domain/repositories/habit_tracking_repository.dart";
import "package:pomodore/features/habit_tracking/domain/usecases/add_new_habit_usecase.dart";
import "package:pomodore/features/habit_tracking/domain/usecases/delete_habit_usecase.dart";
import "package:pomodore/features/habit_tracking/domain/usecases/done_today_habit_usecase.dart";
import "package:pomodore/features/habit_tracking/domain/usecases/edit_habit_usecase.dart";
import "package:pomodore/features/habit_tracking/domain/usecases/get_all_habits_usecase.dart";
import "package:pomodore/features/habit_tracking/presentation/blocs/habit_tracker_bloc/habit_tracker_bloc.dart";
import "package:pomodore/features/task_management/data/data_sources/timer_local_data_source.dart";
import "package:pomodore/features/task_management/data/repositories/task_repository_impl.dart";
import "package:pomodore/features/task_management/data/repositories/timer_repository_impl.dart";
import "package:pomodore/features/task_management/domain/repositories/task_repository.dart";
import "package:pomodore/features/task_management/domain/repositories/timer_repository.dart";
import "package:pomodore/features/task_management/domain/usecases/add_pomodoro_to_db_usecase.dart";
import "package:pomodore/features/task_management/domain/usecases/add_task_usecase.dart";
import "package:pomodore/features/task_management/domain/usecases/check_daily_goal_usecase.dart";
import "package:pomodore/features/task_management/domain/usecases/complete_task_usecase.dart";
import "package:pomodore/features/task_management/domain/usecases/delete_task_usecase.dart";
import "package:pomodore/features/task_management/domain/usecases/edit_task_usecase.dart";
import "package:pomodore/features/task_management/domain/usecases/get_all_tasks.dart";
import "package:pomodore/features/task_management/domain/usecases/get_analysis_usecase.dart";
import "package:pomodore/features/task_management/domain/usecases/get_daily_information_usecase.dart";
import "package:pomodore/features/task_management/domain/usecases/get_specific_date_tasks_usecase.dart";
import "package:pomodore/features/task_management/domain/usecases/get_today_pomodoros_usecase.dart";
import "package:pomodore/features/task_management/domain/usecases/restore_timer_state_usecase.dart";
import "package:pomodore/features/task_management/domain/usecases/save_daily_goal_usecase.dart";
import "package:pomodore/features/task_management/domain/usecases/save_timer_state_usecase.dart";
import "package:pomodore/features/task_management/presentation/blocs/analysis_bloc/analysis_bloc.dart";
import "package:pomodore/features/task_management/presentation/blocs/home_bloc/home_bloc.dart";
import "package:pomodore/features/task_management/presentation/blocs/tasks_bloc/tasks_bloc.dart";
import "package:pomodore/features/task_management/presentation/blocs/timer_bloc/timer_bloc.dart";

import "core/services/database/collections/pomodoro_collection.dart";
import "core/services/database/isar_helper.dart";
import "core/services/database/storage.dart";
import "core/utils/ticker.dart";
import "features/task_management/data/data_sources/tasks_local_data_source.dart";
import "features/task_management/domain/usecases/get_uncompleted_tasks_usecase.dart";

final getIt = GetIt.instance;

Future inject() async {
  FStorage.initialize();

  // inject nosql database
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [
      HabitCollectionSchema,
      HabitTrackerCollectionSchema,
      CategoryCollectionSchema,
      DailyGoalCollectionSchema,
      PomodoroCollectionSchema,
      TaskCollectionSchema,
    ],
    directory: dir.path,
  );
  getIt.registerSingleton<Isar>(isar);
  getIt.registerSingleton(IsarHelper(getIt()));

  // player
  getIt.registerSingleton(AudioPlayer());
  final AudioService audioService = AudioService();
  getIt.registerSingleton<AudioService>(audioService);

  // local notification
  final AppLocalNotification appLocalNotification = AppLocalNotification();
  await appLocalNotification.initializeNotification();
  getIt.registerSingleton(appLocalNotification);

  // inject ticker
  const Ticker ticker = Ticker();
  getIt.registerSingleton<Ticker>(ticker);

  // inject datasource
  getIt.registerSingleton<TasksLocalDataSource>(TasksLocalDataSource(getIt()));
  getIt.registerSingleton<SettingsLocalDataSources>(SettingsLocalDataSources());
  getIt.registerSingleton<TimerLocalDataSource>(TimerLocalDataSource(getIt()));
  getIt.registerSingleton<HabitLocalDataSource>(HabitLocalDataSource(getIt()));

  // inject repositories
  getIt.registerSingleton<TaskRepository>(TaskRepositoryImpl(getIt()));
  getIt.registerSingleton<SettingsRepository>(SettingsRepositoryImpl(getIt()));
  getIt.registerSingleton<TimerRepository>(TimerRepositoryImpl(getIt()));
  getIt.registerSingleton<HabitTrackingRepository>(
      HabitTrackingRepositoryImpl(getIt()));

  // inject use-cases
  getIt.registerSingleton<AddTaskUsecase>(AddTaskUsecase(getIt()));
  getIt.registerSingleton<GetSpecificDateTasksUseCase>(
      GetSpecificDateTasksUseCase(getIt()));
  getIt.registerSingleton<CompleteTaskUseCase>(CompleteTaskUseCase(getIt()));
  getIt.registerSingleton<DeleteTaskUseCase>(DeleteTaskUseCase(getIt()));
  getIt.registerSingleton<AddPomodoroToDbUseCase>(
      AddPomodoroToDbUseCase(getIt()));
  getIt.registerSingleton<GetTodayPomodorosUseCase>(
      GetTodayPomodorosUseCase(getIt()));
  getIt.registerSingleton<GetSettingsUseCase>(GetSettingsUseCase(getIt()));
  getIt.registerSingleton<EditTaskUseCase>(EditTaskUseCase(getIt()));
  getIt
      .registerSingleton<ChangeSettingsUseCase>(ChangeSettingsUseCase(getIt()));
  getIt.registerSingleton<GetDailyInformationUseCase>(
      GetDailyInformationUseCase(getIt()));
  getIt.registerSingleton<GetUnCompletedTasksUseCase>(
      GetUnCompletedTasksUseCase(getIt()));
  getIt.registerSingleton(GetAllTasksUseCase(getIt()));
  getIt.registerSingleton<GetAnalysisUseCase>(GetAnalysisUseCase(getIt()));
  getIt.registerSingleton<ChangeLocaleUseCase>(ChangeLocaleUseCase(getIt()));
  getIt.registerSingleton<GetLocaleUseCase>(GetLocaleUseCase(getIt()));
  getIt.registerSingleton<GetThemeUseCase>(GetThemeUseCase(getIt()));
  getIt.registerSingleton<ChangeThemeUseCase>(ChangeThemeUseCase(getIt()));
  getIt.registerSingleton<SaveDailyGoalUseCase>(SaveDailyGoalUseCase(getIt()));
  getIt
      .registerSingleton<CheckDailyGoalUseCase>(CheckDailyGoalUseCase(getIt()));
  getIt
      .registerSingleton<SaveTimerStateUseCase>(SaveTimerStateUseCase(getIt()));
  getIt.registerSingleton<RestoreTimerStateUseCase>(
      RestoreTimerStateUseCase(getIt()));
  // habit tracking usecases
  getIt.registerSingleton(AddNewHabitUseCase(getIt()));
  getIt.registerSingleton(DeleteHabitUseCase(getIt()));
  getIt.registerSingleton(DoneTodayHabitUseCase(getIt()));
  getIt.registerSingleton(EditHabitUseCase(getIt()));
  getIt.registerSingleton(GetAllHabitUseCase(getIt()));

  // inject blocs
  // global bloc
  getIt.registerSingleton<TimerBloc>(TimerBloc(
    ticker: getIt(),
    restoreTimerStateUseCase: getIt(),
    saveTimerStateUseCase: getIt(),
    addPomodoroToDbUseCase: getIt(),
  ));
  getIt.registerSingleton<BaseBloc>(BaseBloc());
  getIt.registerFactory<SettingsBloc>(() => SettingsBloc(
        getSettingUseCase: getIt(),
        changeSettingsUseCase: getIt(),
        changeLocaleUseCase: getIt(),
        getLocaleUseCase: getIt(),
        changeThemeUseCase: getIt(),
        getThemeUseCase: getIt(),
      ));
  // local bloc
  getIt.registerFactory<TasksBloc>(() => TasksBloc(
        addTaskUsecase: getIt(),
        getAllTasksUseCase: getIt(),
        completeTaskUseCase: getIt(),
        deleteTaskUseCase: getIt(),
        editTaskUseCase: getIt(),
      ));
  getIt.registerFactory<AnalysisBloc>(() => AnalysisBloc(getIt()));
  getIt.registerFactory<HomeBloc>(() => HomeBloc(
        getDailyInformationUseCase: getIt(),
        getUnCompletedUseCase: getIt(),
        checkDailyGoalUseCase: getIt(),
        saveDailyGoalUseCase: getIt(),
      ));
  getIt.registerFactory<HabitTrackerBloc>(
    () => HabitTrackerBloc(
      addNewHabitUseCase: getIt(),
      deleteHabitUseCase: getIt(),
      doneTodayHabitUseCase: getIt(),
      editHabitUseCase: getIt(),
      getAllHabitUseCase: getIt(),
    ),
  );
}
