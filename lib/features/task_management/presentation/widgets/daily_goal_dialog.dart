import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodore/core/shared_widgets/global_button.dart';
import 'package:pomodore/core/utils/size_config.dart';

import '../../../../exports.dart';
import '../blocs/home_bloc/home_bloc.dart';

Future<void> showDailyGoalDialog(
    BuildContext context, HomeBloc homeBloc) async {
  AppLocalizations localization = AppLocalizations.of(context)!;
  int value = 1;

  await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text(localization.dailyGoalTitle),
          children: <Widget>[
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Text(
              localization.dailyGoalHint,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(DailyGoalUpdated(--value));
                      },
                      icon: const Icon(Icons.arrow_back)),
                  BlocBuilder(
                    bloc: homeBloc,
                    builder: (context, state) {
                      if (state is UpdateDailyGoalSuccess) value = state.value;
                      return Text(
                        value.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      );
                    },
                  ),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(DailyGoalUpdated(++value));
                      },
                      icon: const Icon(Icons.arrow_forward)),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GlobalButton(
                title: localization.submitButton,
                onPressed: () {
                  homeBloc.add(DailyGoalSaved(value));
                },
              ),
            ),
          ],
        );
      });
}
