import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pomodore/core/constant/constant.dart';
import 'package:pomodore/core/utils/size_config.dart';
import 'package:pomodore/core/widgets/base_app_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: AppConstant.settingsTitle),
      body: Column(
        children: [
          const SizedBox(height: 10),
          SwitchListTile.adaptive(
            title: Row(
              children: const [
                Icon(Icons.notifications_off),
                SizedBox(width: 10),
                Text(AppConstant.generalNotificationTitle),
              ],
            ),
            value: true,
            onChanged: (value) {},
          ),
          const SizedBox(height: 10),
          SwitchListTile.adaptive(
            title: Row(
              children: const [
                Icon(Icons.keyboard_voice),
                SizedBox(width: 10),
                Text(AppConstant.soundTitle),
              ],
            ),
            value: true,
            onChanged: (value) {},
          ),
          const SizedBox(height: 10),
          if (Platform.isAndroid || Platform.isIOS)
            Column(
              children: [
                SwitchListTile.adaptive(
                  title: Row(
                    children: const [
                      Icon(Icons.vibration),
                      SizedBox(width: 10),
                      Text(AppConstant.vibrationTitle),
                    ],
                  ),
                  value: true,
                  onChanged: (value) {},
                ),
                const SizedBox(height: 10),
              ],
            ),
          SwitchListTile.adaptive(
            title: Row(
              children: const [
                Icon(Icons.update),
                SizedBox(width: 10),
                Text(AppConstant.appUpdatesTitle),
              ],
            ),
            value: true,
            onChanged: (value) {},
          ),
          const SizedBox(height: 10),
          SwitchListTile.adaptive(
            title: Row(
              children: const [
                Icon(Icons.tips_and_updates),
                SizedBox(width: 10),
                Text(AppConstant.newTipTitle),
              ],
            ),
            value: true,
            onChanged: (value) {},
          ),
          const SizedBox(height: 10),
          SwitchListTile.adaptive(
            title: Row(
              children: const [
                Icon(Icons.celebration),
                SizedBox(width: 10),
                Text(AppConstant.showAdsTitle),
              ],
            ),
            value: true,
            onChanged: (value) {},
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Row(
                  children: [
                    const Icon(Icons.color_lens),
                    const SizedBox(width: 10),
                    Text(
                      AppConstant.changeThemeTitle,
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
                                "Select Theme",
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
                                      child: index == 1
                                          ? const Icon(Icons.check)
                                          : null,
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
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Row(
                  children: [
                    const Icon(Ionicons.language),
                    const SizedBox(width: 10),
                    Text(
                      AppConstant.changeLanguageTitle,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                const Expanded(child: SizedBox(width: 1)),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_drop_down_circle),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bottomSheet(BuildContext context, Widget? child) =>
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: SizeConfig.heightMultiplier * 90,
              decoration: const BoxDecoration(
                color: AppConstant.blackColor,
              ),
              child: child ?? Container());
        },
      );
}
