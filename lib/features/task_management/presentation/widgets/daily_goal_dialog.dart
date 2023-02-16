import 'package:flutter/material.dart';
import 'package:pomodore/core/shared_widgets/global_button.dart';
import 'package:pomodore/core/utils/size_config.dart';

import '../../../../exports.dart';

Future<void> showDailyGoalDialog(BuildContext context) async {
  AppLocalizations localization = AppLocalizations.of(context)!;
  await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: const Text('Select Daily Goal Count'),
          children: <Widget>[
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Text(
              "How many task you can do in one day :)",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                  Text(
                    "2",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GlobalButton(
                title: 'Submit',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      });
}
