import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pomodore/core/constant/constant.dart';
import 'package:pomodore/core/shared_widgets/base_app_bar.dart';
import 'package:pomodore/core/shared_widgets/global_button.dart';
import 'package:pomodore/core/utils/size_config.dart';
import 'package:pomodore/core/utils/utils.dart';
import 'package:pomodore/features/task_management/presentation/blocs/timer_bloc/timer_bloc.dart';
import 'package:pomodore/features/task_management/presentation/pages/analyze_page.dart';

import '../../../../exports.dart';
import '../widgets/timer_task.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TimerView();
  }
}

class TimerView extends StatelessWidget {
  const TimerView({Key? key}) : super(key: key);

  MaterialBanner _showMaterialBanner(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;

    return MaterialBanner(
        content: Text(
          localization.saveProcessTitle,
          style: const TextStyle(
            color: AppConstant.scaffoldColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const Icon(
          Ionicons.save_outline,
          color: AppConstant.scaffoldColor,
        ),
        backgroundColor: AppConstant.primaryColor.withOpacity(.7),
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: Text(
              localization.yesTitle,
              style: const TextStyle(color: AppConstant.scaffoldColor),
            ),
          ),
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: Text(
              localization.noTitle,
              style: const TextStyle(color: AppConstant.scaffoldColor),
            ),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;

    return BlocListener<TimerBloc, TimerState>(
      listener: (context, state) {
        if (state is SaveCurrentTimeStateDialog) {
          ScaffoldMessenger.of(context)
            ..removeCurrentMaterialBanner()
            ..showMaterialBanner(_showMaterialBanner(context));
        }
      },
      child: Scaffold(
        appBar: BaseAppBar(
          title: localization.timerTitle,
          action: const Icon(
            Icons.bar_chart,
          ),
          onPressed: () {
            Navigator.pushNamed(context, AnalyzePage.routeName);
          },
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraint) =>
              SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SelectATaskToStart(),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 5,
                  ),
                  const TimerBar(),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 5,
                  ),
                  const TimerButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TimerBar extends StatelessWidget {
  const TimerBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                value: context.select((TimerBloc bloc) => bloc.state.duration) /
                    TimerBloc.getDuration,
                color: AppConstant.primaryColor,
                backgroundColor: AppConstant.primaryColor.withOpacity(.2),
                strokeWidth: 7,
              ),
            ),
          ),
          const TimerText(),
        ],
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
              backgroundColor: AppConstant.secondaryColor,
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
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GlobalButton(
              width: SizeConfig.heightMultiplier * 10,
              height: SizeConfig.heightMultiplier * 10,
              backgroundColor: AppConstant.primaryColor,
              onPressed: () => context.read<TimerBloc>()
                ..add(TimerReset())
                ..add(SaveCurrentTimeStateDialogShowed(
                  duration: TimerBloc.getDuration,
                  taskUid: "",
                )),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              child: const Icon(
                Ionicons.square,
                color: AppConstant.scaffoldColor,
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
      final duration = context.select((TimerBloc bloc) => bloc.state.duration);

      return Align(
        alignment: Alignment.center,
        child: Text(
          Utils.formatSecToMinSec(timeInSecond: duration),
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: AppConstant.primaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
      );
    });
  }
}
