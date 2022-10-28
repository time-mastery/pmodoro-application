import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pomodore/core/constant/constant.dart';
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
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_drop_down_circle)),
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
                    icon: const Icon(Icons.arrow_drop_down_circle)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
