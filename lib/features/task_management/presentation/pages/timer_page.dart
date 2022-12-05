import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pomodore/core/constant/constant.dart';
import 'package:pomodore/core/shared_widgets/base_app_bar.dart';
import 'package:pomodore/core/shared_widgets/my_button.dart';
import 'package:pomodore/core/utils/size_config.dart';
import 'package:pomodore/core/utils/utils.dart';
import 'package:pomodore/di.dart';
import 'package:pomodore/features/task_management/presentation/blocs/timer_bloc/timer_bloc.dart';
import 'package:pomodore/features/task_management/presentation/pages/analyze_page.dart';

import '../../../../exports.dart';
import '../widgets/timer_task.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<TimerBloc>(),
      child: const TimerView(),
    );
  }
}

class TimerView extends StatelessWidget {
  const TimerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: BaseAppBar(
        title: localization.timerTitle,
        action: const Icon(
          Icons.bar_chart,
        ),
        onPressed: () {
          Navigator.pushNamed(context, AnalyzePage.routeName);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: SizeConfig.heightMultiplier * 5,
            ),
            const TimerTask(
              count: 2,
              targetCount: 5,
              title: "Deutsch lernen",
              totalTime: 29,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3,
            ),
            SizedBox(
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
                        value: 20,
                        color: AppConstant.primaryColor,
                        backgroundColor:
                            AppConstant.primaryColor.withOpacity(.2),
                        strokeWidth: 7,
                      ),
                    ),
                  ),
                  const TimerText(),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3,
            ),
            const FocusTimeText(),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(
                  width: SizeConfig.heightMultiplier * 8,
                  height: SizeConfig.heightMultiplier * 8,
                  backgroundColor: AppConstant.primaryColor,
                  onPressed: () => context.read<TimerBloc>().add(ResetTimer()),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: const Icon(
                    Ionicons.repeat,
                    color: AppConstant.scaffoldColor,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                MyButton(
                  width: SizeConfig.heightMultiplier * 10,
                  height: SizeConfig.heightMultiplier * 10,
                  backgroundColor: AppConstant.secondaryColor,
                  onPressed: () =>
                      context.read<TimerBloc>().add(const StartTimer(60)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: const Icon(
                    Ionicons.play,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                MyButton(
                  width: SizeConfig.heightMultiplier * 8,
                  height: SizeConfig.heightMultiplier * 8,
                  backgroundColor: AppConstant.primaryColor,
                  onPressed: () => context.read<TimerBloc>().add(ResetTimer()),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: const Icon(
                    Ionicons.square,
                    color: AppConstant.scaffoldColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
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

class FocusTimeText extends StatelessWidget {
  const FocusTimeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;

    return Builder(builder: (context) {
      final duration = context.select((TimerBloc bloc) => bloc.state.duration);

      return Text(localization.stayFocus.replaceAll(
          "#", Utils.formatSecToMinSec(timeInSecond: 60 - duration)));
    });
  }
}
