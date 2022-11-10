import 'package:flutter/material.dart';
import 'package:pomodore/core/shared_widgets/base_app_bar.dart';
import 'package:pomodore/features/home/presentation/widgets/notificaiton_item.dart';

import '../../../../exports.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  static const routeName = "/notifications";

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: BaseAppBar(
        title: localization.notificationsTitle,
        hasBackBtn: true,
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) => NotificationItem(
            title: "Notification $index",
            description: "This is a description for this notification $index",
            color: Colors.primaries[index % 17],
            icon: Icons.notifications_sharp),
      ),
    );
  }
}
