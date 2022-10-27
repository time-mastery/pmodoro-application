import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pomodore/core/widgets/base_app_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: "Settings"),
      body: Column(
        children: [
          SizedBox(height: 10),
          SwitchListTile.adaptive(
            title: Row(
              children: [
                Icon(Icons.notifications_off),
                SizedBox(width: 10),
                Text("General Notification"),
              ],
            ),
            value: true,
            onChanged: (value) {},
          ),
          SizedBox(height: 10),
          SwitchListTile.adaptive(
            title: Row(
              children: [
                Icon(Icons.keyboard_voice),
                SizedBox(width: 10),
                Text("Sound"),
              ],
            ),
            value: true,
            onChanged: (value) {},
          ),
          SizedBox(height: 10),
          if (Platform.isAndroid || Platform.isIOS)
            Column(
              children: [
                SwitchListTile.adaptive(
                  title: Row(
                    children: [
                      Icon(Icons.vibration),
                      SizedBox(width: 10),
                      Text("Vibration"),
                    ],
                  ),
                  value: true,
                  onChanged: (value) {},
                ),
                SizedBox(height: 10),
              ],
            ),
          SwitchListTile.adaptive(
            title: Row(
              children: [
                Icon(Icons.update),
                SizedBox(width: 10),
                Text("App Updates"),
              ],
            ),
            value: true,
            onChanged: (value) {},
          ),
          SizedBox(height: 10),
          SwitchListTile.adaptive(
            title: Row(
              children: [
                Icon(Icons.tips_and_updates),
                SizedBox(width: 10),
                Text("New Tip Available"),
              ],
            ),
            value: true,
            onChanged: (value) {},
          ),
          SizedBox(height: 10),
          SwitchListTile.adaptive(
            title: Row(
              children: [
                Icon(Icons.celebration),
                SizedBox(width: 10),
                Text("Show Ads To Support"),
              ],
            ),
            value: true,
            onChanged: (value) {},
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.color_lens),
                    SizedBox(width: 10),
                    Text(
                      "Change Theme",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                Expanded(child: SizedBox(width: 1)),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_drop_down_circle)),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Row(
                  children: [
                    Icon(Ionicons.language),
                    SizedBox(width: 10),
                    Text(
                      "Change Language",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                Expanded(child: SizedBox(width: 1)),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_drop_down_circle)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
