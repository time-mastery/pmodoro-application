import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pomodore/core/shared_widgets/base_app_bar.dart';
import 'package:pomodore/core/shared_widgets/global_button.dart';
import 'package:pomodore/core/utils/responsive/size_config.dart';
import 'package:pomodore/core/utils/utils.dart';
import 'package:pomodore/features/task_management/domain/entities/pomodoro_entity.dart';
import 'package:pomodore/features/task_management/presentation/blocs/tasks_bloc/tasks_bloc.dart';
import 'package:pomodore/features/task_management/presentation/blocs/timer_bloc/timer_bloc.dart';
import 'package:pomodore/features/task_management/presentation/pages/analysis_page.dart';

import '../../../../core/constant/constant.dart';
import '../../../../di.dart';
import '../../../../exports.dart';
import '../widgets/timer_task.dart';

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
    AppLocalizations localization = AppLocalizations.of(context)!;

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
    AppLocalizations localization = AppLocalizations.of(context)!;

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
          var snack = SnackBar(
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
                          height: SizeConfig.heightMultiplier * 40,
                        ),
                        const TimerButtons(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: TimerBar(),
            ),
          ],
        ),
      ),
    );
  }
}

class TimerBar extends StatefulWidget {
  const TimerBar({Key? key}) : super(key: key);

  @override
  State<TimerBar> createState() => _TimerBarState();
}

class _TimerBarState extends State<TimerBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _animation = Tween<double>(begin: 0, end: 60).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TimerBloc, TimerState>(
      listener: (context, state) {
        if (state is TimerInProgress) {
          if (!_controller.isAnimating) {
            _controller.repeat(reverse: true);
          }
        } else {
          _controller.reset();
        }
      },
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) => Container(
                  width:
                      MediaQuery.of(context).size.width * .5 + _animation.value,
                  height:
                      MediaQuery.of(context).size.width * .5 + _animation.value,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(.1),
                      width: 7,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                height: MediaQuery.of(context).size.width * .5,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .5,
                        height: MediaQuery.of(context).size.width * .5,
                        child: CircularProgressIndicator(
                          value: context.select(
                                  (TimerBloc bloc) => bloc.state.duration) /
                              TimerBloc.getDuration,
                          strokeWidth: 7,
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(.1),
                        ),
                      ),
                    ),
                    const TimerText(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimerButtons extends StatelessWidget {
  const TimerButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlobalButton(
              width: SizeConfig.heightMultiplier * 10,
              height: SizeConfig.heightMultiplier * 10,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              onPressed: () {
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              child: Icon(
                (state is TimerInProgress) ? Ionicons.pause : Ionicons.play,
                size: 30,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GlobalButton(
              width: SizeConfig.heightMultiplier * 10,
              height: SizeConfig.heightMultiplier * 10,
              backgroundColor: Theme.of(context).colorScheme.primary,
              onPressed: () => context.read<TimerBloc>()
                ..add(SaveCurrentTimerStateDialogShowed(
                  duration: state.duration,
                  taskItem: context.read<TimerBloc>().taskItem!,
                ))
                ..add(TimerTaskDeSelected())
                ..add(TimerReset()),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              child: const Icon(
                Ionicons.square,
              ),
            ),
          ],
        );
      },
    );
  }
}

class TimerText extends StatelessWidget {
  const TimerText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      AppLocalizations localization = AppLocalizations.of(context)!;

      final duration = context.select((TimerBloc bloc) => bloc.state.duration);
      final listOfTimerDuration = [1, 5, 10, 15, 25, 40, 60, 90, 120];
      return BlocListener<TimerBloc, TimerState>(
        listener: (context, state) {
          if (state is ChangeTimerDurationLoading) Navigator.pop(context);
        },
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Theme.of(context).colorScheme.background,
              elevation: 20,
              isScrollControlled: true,
              builder: (context) {
                return FractionallySizedBox(
                  heightFactor: .2,
                  child: Padding(
                    padding: const EdgeInsets.all(AppConstant.modalPadding),
                    child: Column(
                      children: [
                        Text(
                          localization.changeTimerDurationTitle,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: listOfTimerDuration.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                context.read<TimerBloc>().add(
                                      TimerDurationSet(
                                          listOfTimerDuration[index]),
                                    );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      listOfTimerDuration[index].toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Align(
            alignment: Alignment.center,
            child: Text(
              Utils.formatSecToMinSec(timeInSecond: duration),
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      );
    });
  }
}
