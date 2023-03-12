import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:google_fonts/google_fonts.dart";
import "package:ionicons/ionicons.dart";
import "package:pomodore/core/shared_widgets/base_app_bar.dart";
import "package:pomodore/core/utils/responsive/size_config.dart";
import "package:pomodore/core/utils/utils.dart";
import "package:pomodore/features/task_management/domain/entities/pomodoro_entity.dart";
import "package:pomodore/features/task_management/presentation/blocs/tasks_bloc/tasks_bloc.dart";
import "package:pomodore/features/task_management/presentation/blocs/timer_bloc/timer_bloc.dart";
import "package:pomodore/features/task_management/presentation/pages/analysis_page.dart";
import "package:pomodore/features/task_management/presentation/widgets/timer_task.dart";

import "../../../../di.dart";
import "../../../../exports.dart";
import "../widgets/timer_duration_selector.dart";

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<TasksBloc>(),
      child: const TimerView(),
    );
  }
}

class TimerView extends StatelessWidget {
  const TimerView({Key? key}) : super(key: key);

  MaterialBanner _showMaterialBanner(BuildContext context,
      {required int duration, String? taskUid}) {
    final AppLocalizations localization = AppLocalizations.of(context)!;

    return MaterialBanner(
        content: Text(
          localization.saveProcessTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const Icon(
          Ionicons.save_outline,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.read<TimerBloc>().add(
                    CurrentPomodoroToDatabaseSaved(
                      PomodoroEntity(
                        duration: Utils.calculatePomodoroTime(
                          TimerBloc.getDuration,
                          duration,
                        ),
                        dateTime: DateTime.now().toString(),
                      ),
                    ),
                  );
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: Text(
              localization.yesTitle,
            ),
          ),
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: Text(
              localization.noTitle,
            ),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;

    return BlocListener<TimerBloc, TimerState>(
      listenWhen: (previous, current) {
        if (previous is TimerInitial &&
            current is StartTimerWithoutTaskFailure) {
          return true;
        } else {
          return (current is! TimerInitial && previous is! TimerInitial);
        }
      },
      listener: (context, state) {
        if (state is SaveCurrentTimeStateDialog) {
          ScaffoldMessenger.of(context)
            ..removeCurrentMaterialBanner()
            ..showMaterialBanner(_showMaterialBanner(
              context,
              duration: state.duration,
              taskUid: context.read<TimerBloc>().taskItem?.id,
            ));
        }
        if (state is StartTimerWithoutTaskFailure) {
          final snack = SnackBar(
              content: Text(localization.startTimerWithoutTaskWarning));
          ScaffoldMessenger.of(context).showSnackBar(snack);
        }
      },
      child: Scaffold(
        appBar: BaseAppBar(
          title: localization.timerTitle,
          action: const Icon(
            Icons.bar_chart,
          ),
          onPressed: () {
            Navigator.pushNamed(context, AnalysisPage.routeName);
          },
        ),
        body: Stack(
          children: [
            LayoutBuilder(
              builder: (p0, p1) => SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: p1.maxHeight),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SelectATaskToStart(),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 2,
                        ),
                        const TimerBar(),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 2,
                        ),
                        const TimerDurationSelector(),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 3,
                        ),
                        const TimerButtons(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimerBar extends StatelessWidget {
  const TimerBar({super.key});

  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);

    return Align(
      alignment: Alignment.center,
      child: Text(
        Utils.formatSecToMinSec(timeInSecond: duration),
        style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: 80,
              fontFamily: GoogleFonts.rubikMonoOne().fontFamily,
            ),
      ),
    );
  }
}

class TimerButtons extends StatefulWidget {
  const TimerButtons({Key? key}) : super(key: key);

  @override
  State<TimerButtons> createState() => _TimerButtonsState();
}

class _TimerButtonsState extends State<TimerButtons>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * .30;
    final height = MediaQuery.of(context).size.width * .30;
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        return Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: width,
                    height: height,
                    child: CircularProgressIndicator(
                      value: context
                              .select((TimerBloc bloc) => bloc.state.duration) /
                          TimerBloc.getDuration,
                      strokeWidth: 5,
                      backgroundColor:
                          Theme.of(context).colorScheme.primary.withOpacity(.1),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (state is TimerInProgress) {
                      context.read<TimerBloc>().add(TimerPaused());
                    } else {
                      if (state.duration == TimerBloc.getDuration) {
                        context
                            .read<TimerBloc>()
                            .add(TimerStarted(TimerBloc.getDuration));
                      } else {
                        context.read<TimerBloc>().add(TimerResumed());
                      }
                    }
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: width,
                      height: height,
                      child: Center(
                        child: Container(
                          width: width - 20,
                          height: height - 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(.2),
                          ),
                          child: Icon(
                            (state is TimerInProgress)
                                ? Icons.pause
                                : Icons.play_arrow,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            GestureDetector(
              onTap: () => context.read<TimerBloc>()
                ..add(SaveCurrentTimerStateDialogShowed(
                  duration: state.duration,
                  taskItem: context.read<TimerBloc>().taskItem!,
                ))
                ..add(TimerTaskDeSelected())
                ..add(TimerReset()),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                child: Icon(
                  Icons.stop,
                  color: Theme.of(context).colorScheme.background,
                  size: 30,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
