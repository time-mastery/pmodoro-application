import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "package:pomodore/core/shared_widgets/base_app_bar.dart";
import "package:pomodore/core/shared_widgets/global_indicator.dart";
import "package:pomodore/features/habit_tracking/domain/entities/habit_entity.dart";

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

class HabitTrackingView extends StatefulWidget {
  const HabitTrackingView({super.key});

  @override
  State<HabitTrackingView> createState() => _HabitTrackingViewState();
}

class _HabitTrackingViewState extends State<HabitTrackingView> {
  List<HabitEntity> habits = [];

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
      body: BlocConsumer(
        bloc: context.read<HabitTrackerBloc>(),
        listener: (context, state) {
          if (state is DeleteHabit && !state.loading && !state.error) {
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          if (state is FetchHabits) {
            if (state.loading) {
              return const Center(
                child: GlobalIndicator(),
              );
            }
            if (state.habits.isEmpty) {
              return Center(
                child: Text(localization.noHabitMessage),
              );
            }
            if (!state.loading && !state.error && state.habits.isNotEmpty) {
              habits = state.habits;
            }
          }

          if (state is DeleteHabit && !state.error && !state.loading) {
            habits = state.habits;
          }

          if (state is DoneHabit && !state.error && !state.loading) {
            habits = state.habits;
          }

          if (state is EditHabit && !state.error && !state.loading) {
            habits = state.habits;
          }

          return ListView.builder(
            itemCount: habits.length,
            itemBuilder: (context, index) => ListTile(
              title: HabitItemWidget(
                item: habits[index],
                habits: habits,
              ),
            ),
          );
        },
      ),
    );
  }
}
