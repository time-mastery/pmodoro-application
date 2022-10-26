import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pomodore/core/constant/constant.dart';
import 'package:pomodore/core/widgets/base_app_bar.dart';
import 'package:pomodore/core/widgets/my_button.dart';
import 'package:pomodore/features/timer/presentation/widgets/timer_task.dart';

// todo : timer should be global
class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  Timer? _timer;
  int _sec = 60 * 30;
  final int _max = 60 * 30;

  stopAndDelete() {
    _sec = 0;
    _timer?.cancel();
    _timer = null;
    setState(() {});
  }

  reset() {
    _sec = _max;
    _timer?.cancel();
    _timer = null;
    start();
  }

  start() {
    _timer ??= Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_sec > 0) {
        setState(() {
          _sec--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  formattedTime({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: AppConstant.timerTitle),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TimerTask(
                count: 2,
                targetCount: 5,
                title: "Deutsch lernen",
                totalTime: 29),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              height: MediaQuery.of(context).size.width * .6,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * .6,
                      height: MediaQuery.of(context).size.width * .6,
                      child: CircularProgressIndicator(
                        value: _sec / _max,
                        color: AppConstant.purpleColor,
                        backgroundColor:
                            AppConstant.purpleColor.withOpacity(.2),
                        strokeWidth: 7,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      child: Text(
                        _sec == 0
                            ? AppConstant.smile
                            : formattedTime(timeInSecond: _sec),
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  color: AppConstant.purpleColor,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(AppConstant.stayFocus.replaceAll(
                "#", formattedTime(timeInSecond: (30 * 60) - _sec))),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(
                  width: 55,
                  height: 55,
                  backgroundColor: AppConstant.purpleColor,
                  onPressed: () => reset(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: const Icon(
                    Ionicons.repeat,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                MyButton(
                  width: 80,
                  height: 80,
                  backgroundColor: AppConstant.cyanColor,
                  onPressed: () => start(),
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
                  width: 55,
                  height: 55,
                  backgroundColor: AppConstant.purpleColor,
                  onPressed: () => stopAndDelete(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: const Icon(
                    Ionicons.square,
                    size: 18,
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
