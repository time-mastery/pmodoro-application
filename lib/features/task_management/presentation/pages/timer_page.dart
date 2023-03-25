import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:ionicons/ionicons.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";
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
import "timer_widgets/timer_bar_widgets.dart";
import "timer_widgets/timer_buttons_widget.dart";

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
                        taskUid: context.read<TimerBloc>().taskItem?.id,
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
        if (previous is TimerInitial) {
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
                        (SizeConfig.heightMultiplier * 2).spaceH(),
                        const TimerBar(),
                        (SizeConfig.heightMultiplier * 2).spaceH(),
                        const TimerDurationSelector(),
                        (SizeConfig.heightMultiplier * 2).spaceH(),
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
