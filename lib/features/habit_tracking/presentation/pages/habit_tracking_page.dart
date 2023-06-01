import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "package:flutter_hooks/flutter_hooks.dart";
import "package:pomodore/core/shared_widgets/base_app_bar.dart";
import "package:pomodore/core/shared_widgets/global_indicator.dart";
import "package:pomodore/core/utils/debug_print.dart";
import "package:pomodore/features/habit_tracking/presentation/pages/add_habit_page.dart";
import "package:pomodore/features/habit_tracking/presentation/shared_widgets/habit_item_widget.dart";

import "../../../../di.dart";
import "../../../../exports.dart";
import "../blocs/habit_tracker_bloc/habit_tracker_bloc.dart";

class HabitTrackingPage extends StatelessWidget {
  const HabitTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<HabitTrackerBloc>()..add(AllHabitsFetched()),
      child: const HabitTrackingView(),
    );
  }
}

class HabitTrackingView extends HookWidget {
  const HabitTrackingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: BaseAppBar(
        title: localization.habitTrackingTitle,
        action: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AddHabitPage.routeName).then(
              (value) => context.read<HabitTrackerBloc>().add(
                    AllHabitsFetched(),
                  ),
            );
          },
          icon: const Icon(CupertinoIcons.add_circled_solid),
        ),
      ),
      body: BlocBuilder<HabitTrackerBloc, HabitTrackerState>(
        builder: (context, state) {
          if (state is FetchHabits && !state.error && !state.loading) {
            if (state.habits.isEmpty) {
              return const Center(
                // todo : add this string to the l10n
                child: Text("There is no habit!"),
              );
            }
            return ListView.builder(
              itemCount: state.habits.length,
              itemBuilder: (context, index) => ListTile(
                title: HabitItemWidget(
                  item: state.habits[index],
                ),
              ),
            );
          }
          return const Center(
            child: GlobalIndicator(),
          );
        },
      ),
    );
  }
}
