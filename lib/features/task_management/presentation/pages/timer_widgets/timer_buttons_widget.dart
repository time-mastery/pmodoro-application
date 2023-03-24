import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:pomodore/core/utils/responsive/size_config.dart";
import "package:pomodore/features/task_management/presentation/blocs/timer_bloc/timer_bloc.dart";

class TimerButtons extends StatelessWidget {
  const TimerButtons({Key? key}) : super(key: key);

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
                  taskItem: context.read<TimerBloc>().taskItem,
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
