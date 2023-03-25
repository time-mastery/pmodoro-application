import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "../../../../core/utils/responsive/size_config.dart";
import "../blocs/timer_bloc/timer_bloc.dart";

class TimerDurationSelector extends StatefulWidget {
  const TimerDurationSelector({Key? key}) : super(key: key);

  @override
  State<TimerDurationSelector> createState() => _TimerDurationSelectorState();
}

class _TimerDurationSelectorState extends State<TimerDurationSelector> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initialScroll());
  }

  int getInitIndex() {
    final listOfTimerDuration = [1, 5, 10, 15, 25, 40, 60, 90, 120];
    return listOfTimerDuration.indexOf(TimerBloc.getDuration ~/ 60);
  }

  Future<void> _initialScroll() => _scrollController.animateTo(
        getInitIndex() * 80.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );

  @override
  Widget build(BuildContext context) {
    final listOfTimerDuration = [1, 5, 10, 15, 25, 40, 60, 90, 120];

    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        bool ignoreTouch = (state is TimerInProgress ||
            state is TimerPause ||
            state is StartTimerLoading ||
            state is SaveTimerLoading);

        return IgnorePointer(
          ignoring: ignoreTouch,
          child: SizedBox(
            height: 50,
            width: SizeConfig.widthMultiplier * 100,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.transparent,
                    Colors.white,
                    Colors.white,
                    Colors.transparent,
                  ],
                  stops: [.02, .3, .7, .98],
                ).createShader(bounds);
              },
              child: ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 40),
                scrollDirection: Axis.horizontal,
                itemCount: listOfTimerDuration.length,
                itemBuilder: (context, index) {
                  return BlocBuilder<TimerBloc, TimerState>(
                    builder: (context, state) {
                      if (state is ChangeTimerDurationSuccess) {}
                      final selected = (listOfTimerDuration[index] ==
                          TimerBloc.getDuration / 60);
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: GestureDetector(
                          onTap: () {
                            _scrollController.animateTo(
                              index * 80.0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                            context.read<TimerBloc>().add(
                                  TimerDurationSet(listOfTimerDuration[index]),
                                );
                          },
                          child: Container(
                            width: 70,
                            height: 50,
                            decoration: BoxDecoration(
                              color: selected
                                  ? Theme.of(context).colorScheme.secondary
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 2,
                                color: (listOfTimerDuration[index] ==
                                        TimerBloc.getDuration / 60)
                                    ? Colors.transparent
                                    : Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                listOfTimerDuration[index].toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
