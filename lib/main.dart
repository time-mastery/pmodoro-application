import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:pomodore/core/constant/constant.dart";
import "package:pomodore/core/router/router.dart";
import "package:pomodore/core/services/notification/local_notification.dart";
import "package:pomodore/dependency_injection/injector_widget.dart";

import "package:pomodore/features/configuration/presentation/blocs/settings_bloc/settings_bloc.dart";
import "package:pomodore/features/task_management/domain/entities/pomodoro_entity.dart";

import "core/utils/responsive/size_config.dart";
import "dependency_injection/di.dart";
import "features/task_management/presentation/blocs/timer_bloc/timer_bloc.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const InjectorWidget(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late Locale locale;
  late ThemeData themeData;

  @override
  void initState() {
    super.initState();
    restoreTimerState();
    WidgetsBinding.instance.addObserver(this);
    locale = const Locale("en");
    themeData = AppConstant.defaultLightTheme;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.detached ||
        state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      TimerState state = context.read<TimerBloc>().state;
      if (state is TimerInProgress || state is TimerPause) saveTimerState();
    }
  }

  void saveTimerState() {
    context.read<TimerBloc>().add(const TimerStateSaved());
  }

  void restoreTimerState() {
    context.read<TimerBloc>().add(const TimerStateRestored());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<TimerBloc, TimerState>(
          listener: (context, state) {
            final TimerBloc bloc = context.read<TimerBloc>();
            if (state is RestoreTimerSuccess) {
              if (state.timerStateParams.timerDone) {
                getIt.get<AppLocalNotification>().sendCustomNotification(
                    "hohoo! 🥰", "You completed a pomodoro");
                bloc
                  ..add(
                    CurrentPomodoroToDatabaseSaved(
                      PomodoroEntity(
                        duration: TimerBloc.getDuration,
                        dateTime: DateTime.now(),
                      ),
                      true,
                    ),
                  )
                  ..add(TimerDurationSet(state.timerStateParams.baseDuration));
              } else {
                bloc
                  ..add(TimerTaskSelected(state.timerStateParams.task))
                  ..add(TimerDurationSet(state.timerStateParams.baseDuration))
                  ..add(TimerStarted(state.timerStateParams.duration));
              }
            } else if (state is TimerCompleted) {
              getIt.get<AppLocalNotification>().sendCustomNotification(
                  "Nice Job! 😎", "You completed a pomodoro");
              bloc.add(
                CurrentPomodoroToDatabaseSaved(
                  PomodoroEntity(
                    duration: TimerBloc.getDuration,
                    dateTime: DateTime.now(),
                  ),
                  true,
                ),
              );
            } else if (state is SaveCurrentPomodoroSuccess) {
              getIt.get<AppLocalNotification>().sendCustomNotification(
                  "Yay! 🥳", "Another Pomodoro for today!");
              bloc
                ..add(TimerReset())
                ..add(TimerTaskDeSelected());
            } else if (state is TimerInProgress) {
              getIt
                  .get<AppLocalNotification>()
                  .sendBackgroundNotification(state.duration);
            }
          },
        ),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return OrientationBuilder(
            builder: (context, orientation) {
              if (state is InitDataFetchSuccess) {
                locale = state.locale;
                themeData = state.themeData;
              }

              if (state is ChangeLanguageSuccess) {
                locale = state.locale;
              }

              if (state is ChangeThemeSuccess) {
                themeData = state.themeData;
              }

              return AnnotatedRegion<SystemUiOverlayStyle>(
                value: themeData.brightness != Brightness.dark
                    ? SystemUiOverlayStyle.dark
                    : SystemUiOverlayStyle.light,
                child: LayoutBuilder(builder: (context, constraints) {
                  SizeConfig().init(constraints, orientation);
                  return MaterialApp(
                    title: AppConstant.appName,
                    onGenerateRoute: AppRouter.onGenerationRouter,
                    theme: themeData,
                    debugShowCheckedModeBanner: false,
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: const [
                      Locale("en"),
                      Locale("de"),
                      Locale("fa"),
                    ],
                    locale: locale,
                  );
                }),
              );
            },
          );
        },
      ),
    );
  }
}
