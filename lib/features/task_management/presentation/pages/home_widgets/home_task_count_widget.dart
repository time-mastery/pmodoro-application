import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:pomodore/features/task_management/presentation/blocs/home_bloc/home_bloc.dart";

import "../../../../../exports.dart";

class HomeTaskCountWidget extends StatelessWidget {
  const HomeTaskCountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;
    return BlocBuilder(
      bloc: context.read<HomeBloc>(),
      builder: (context, state) {
        return Text(
          localization.remainTaskTitle.replaceAll(
              "#",
              ((state is FetchHomeDataSuccess)
                  ? state.list.length.toString()
                  : "-")),
          style: Theme.of(context).textTheme.titleLarge,
        );
      },
    );
  }
}
