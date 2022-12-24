import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pomodore/core/constant/constant.dart';
import 'package:pomodore/core/shared_widgets/base_app_bar.dart';
import 'package:pomodore/core/utils/size_config.dart';

import '../../../../exports.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: BaseAppBar(title: localization.settingsTitle),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.heightMultiplier * 3),
            SwitchListTile.adaptive(
              title: Row(
                children: [
                  const Icon(Icons.notifications_off),
                  const SizedBox(width: 10),
                  Text(localization.generalNotificationTitle),
                ],
              ),
              value: true,
              onChanged: (value) {},
            ),
            SizedBox(height: SizeConfig.heightMultiplier * .5),
            SwitchListTile.adaptive(
              title: Row(
                children: [
                  const Icon(Icons.keyboard_voice),
                  const SizedBox(width: 10),
                  Text(localization.soundTitle),
                ],
              ),
              value: true,
              onChanged: (value) {},
            ),
            SizedBox(height: SizeConfig.heightMultiplier * .5),
            if (Platform.isAndroid || Platform.isIOS)
              Column(
                children: [
                  SwitchListTile.adaptive(
                    title: Row(
                      children: [
                        const Icon(Icons.vibration),
                        const SizedBox(width: 10),
                        Text(localization.vibrationTitle),
                      ],
                    ),
                    value: true,
                    onChanged: (value) {},
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * .5),
                ],
              ),
            SwitchListTile.adaptive(
              title: Row(
                children: [
                  const Icon(Icons.update),
                  const SizedBox(width: 10),
                  Text(localization.appUpdatesTitle),
                ],
              ),
              value: true,
              onChanged: (value) {},
            ),
            SizedBox(height: SizeConfig.heightMultiplier * .5),
            SwitchListTile.adaptive(
              title: Row(
                children: [
                  const Icon(Icons.tips_and_updates),
                  const SizedBox(width: 10),
                  Text(localization.newTipTitle),
                ],
              ),
              value: true,
              onChanged: (value) {},
            ),
            SizedBox(height: SizeConfig.heightMultiplier * .5),
            SwitchListTile.adaptive(
              title: Row(
                children: [
                  const Icon(Icons.celebration),
                  SizedBox(width: SizeConfig.widthMultiplier * 2),
                  Text(localization.showAdsTitle),
                ],
              ),
              value: true,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}

class ChangeLanguageBottomSheet extends StatelessWidget {
  const ChangeLanguageBottomSheet({Key? key}) : super(key: key);

  bottomSheet(BuildContext context, Widget? child) =>
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: SizeConfig.heightMultiplier * 90,
              decoration: const BoxDecoration(
                color: AppConstant.scaffoldColor,
              ),
              child: child ?? Container());
        },
      );

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;

    List flags = [
      '🇩🇪       German',
      '🇺🇸       English',
      '🇮🇷       Farsi',
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Row(
            children: [
              const Icon(Ionicons.language),
              SizedBox(width: SizeConfig.widthMultiplier * 2),
              Text(
                localization.changeLanguageTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const Expanded(child: SizedBox(width: 1)),
          IconButton(
            onPressed: () {
              bottomSheet(
                  context,
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 10,
                        ),
                        child: Text(
                          localization.changeLanguageTitle,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: flags.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10),
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppConstant.secondaryColor),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Text(
                                    flags[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ));
            },
            icon: const Icon(Icons.arrow_drop_down_circle),
          ),
        ],
      ),
    );
  }
}

class ChangeThemeBottomSheet extends StatelessWidget {
  const ChangeThemeBottomSheet({Key? key}) : super(key: key);

  bottomSheet(BuildContext context, Widget? child) =>
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: SizeConfig.heightMultiplier * 90,
              decoration: const BoxDecoration(
                color: AppConstant.scaffoldColor,
              ),
              child: child ?? Container());
        },
      );

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;

    List flags = [
      '🇩🇪       German',
      '🇺🇸       English',
      '🇮🇷       Farsi',
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Row(
            children: [
              const Icon(Icons.color_lens),
              SizedBox(width: SizeConfig.widthMultiplier * 2),
              Text(
                localization.changeThemeTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const Expanded(child: SizedBox(width: 1)),
          IconButton(
            icon: const Icon(Icons.arrow_drop_down_circle),
            onPressed: () {
              bottomSheet(
                  context,
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 10,
                        ),
                        child: Text(
                          localization.changeThemeTitle,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 3,
                          children: List.generate(
                            Colors.primaries.length,
                            (index) => Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.primaries[index]
                                      .withOpacity(index == 1 ? .2 : 1),
                                  shape: BoxShape.circle,
                                ),
                                child:
                                    index == 1 ? const Icon(Icons.check) : null,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ));
            },
          ),
        ],
      ),
    );
  }
}
