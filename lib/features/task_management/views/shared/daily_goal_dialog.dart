import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";
import "package:pomodore/core/shared_widgets/global_button.dart";
import "package:pomodore/core/utils/responsive/size_config.dart";
import "package:pomodore/features/task_management/providers/task_management_providers.dart";

import "../../../../exports.dart";
import "../../blocs/home_bloc/home_bloc.dart";

Future<void> showDailyGoalDialog(
  BuildContext context,
) async {
  final AppLocalizations localization = AppLocalizations.of(context)!;
  int value = 1;

  await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Consumer(
          builder: (context, ref, child) {
            final asyncValue = ref.watch(dailyGoalProvider);
            return SimpleDialog(
              backgroundColor: Theme.of(context).colorScheme.surface,
              title: Text(localization.dailyGoalTitle),
              children: <Widget>[
                (SizeConfig.heightMultiplier * 2).spaceH(),
                Text(
                  localization.dailyGoalHint,
                  textAlign: TextAlign.center,
                ),
                (SizeConfig.heightMultiplier * 2).spaceH(),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            ref
                                .read(dailyGoalProvider.notifier)
                                .updateValue(--value);
                          },
                          icon: const Icon(Icons.arrow_back)),
                      asyncValue.when(
                        data: (data) {
                          value = data;
                          return Text(
                            data.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                          );
                        },
                        loading: () => const CircularProgressIndicator(),
                        error: (error, stack) {
                          return Text(
                            error.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                          );
                        },
                      ),
                      IconButton(
                          onPressed: () {
                            ref
                                .read(dailyGoalProvider.notifier)
                                .updateValue(++value);
                          },
                          icon: const Icon(Icons.arrow_forward)),
                    ],
                  ),
                ),
                (SizeConfig.heightMultiplier * 2).spaceH(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GlobalButton(
                    title: localization.submitButton,
                    onPressed: () {
                      ref.read(saveDailyGoalProvider(value));
                    },
                  ),
                ),
              ],
            );
          },
        );
      });
}
