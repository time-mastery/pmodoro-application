import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:google_fonts/google_fonts.dart";
import "package:pomodore/core/utils/utils.dart";
import "package:pomodore/features/task_management/presentation/blocs/timer_bloc/timer_bloc.dart";



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
