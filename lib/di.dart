import "package:audioplayers/audioplayers.dart";
import "package:get_it/get_it.dart";
import "package:pomodore/core/services/audio/audio_service.dart";
import "package:pomodore/core/services/database/drift_helper.dart";
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
import "package:pomodore/features/task_management/data_sources/timer_local_data_source.dart";
import "package:pomodore/features/task_management/repositories/task_repository.dart";
import "package:pomodore/features/task_management/repositories/timer_repository.dart";

import "core/services/database/storage.dart";
import "core/utils/ticker.dart";
import "features/task_management/data_sources/tasks_local_data_source.dart";

final getIt = GetIt.instance;

Future inject() async {
  FStorage.initialize();

  getIt.registerSingleton(AppDatabase());

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
  getIt.registerSingleton<SettingsRepository>(SettingsRepositoryImpl(getIt()));
  getIt.registerSingleton<HabitTrackingRepository>(
      HabitTrackingRepositoryImpl(getIt()));

  // inject use-cases

  getIt.registerSingleton<GetSettingsUseCase>(GetSettingsUseCase(getIt()));
  getIt
      .registerSingleton<ChangeSettingsUseCase>(ChangeSettingsUseCase(getIt()));
  getIt.registerSingleton<ChangeLocaleUseCase>(ChangeLocaleUseCase(getIt()));
  getIt.registerSingleton<GetLocaleUseCase>(GetLocaleUseCase(getIt()));
  getIt.registerSingleton<GetThemeUseCase>(GetThemeUseCase(getIt()));
  getIt.registerSingleton<ChangeThemeUseCase>(ChangeThemeUseCase(getIt()));

  // habit tracking usecases
  getIt.registerSingleton(AddNewHabitUseCase(getIt()));
  getIt.registerSingleton(DeleteHabitUseCase(getIt()));
  getIt.registerSingleton(DoneTodayHabitUseCase(getIt()));
  getIt.registerSingleton(EditHabitUseCase(getIt()));
  getIt.registerSingleton(GetAllHabitUseCase(getIt()));

  // inject blocs
  // global bloc

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
