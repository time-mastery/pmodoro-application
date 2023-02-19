import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pomodore/core/shared_widgets/base_app_bar.dart';
import 'package:pomodore/core/utils/responsive/size_config.dart';
import 'package:pomodore/features/notification_management/presentation/widgets/notificaiton_item.dart';

import '../../../../exports.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  static const routeName = "/notifications";

  @override
  Widget build(BuildContext context) {
    // todo : check it here and connect to the api
    List<String> notificationList = [];
    AppLocalizations localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: BaseAppBar(
        title: localization.notificationsTitle,
        hasBackBtn: true,
      ),
      body: notificationList.isEmpty
          ? emptyListWidget(context)
          : ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) => NotificationItem(
                title: "Notification $index",
                description:
                    "This is a description for this notification $index",
                color: Colors.primaries[index % 17],
                icon: Icons.notifications_sharp,
              ),
            ),
    );
  }

  Widget emptyListWidget(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Ionicons.ice_cream_outline,
            size: 200,
          ),
          SizedBox(height: SizeConfig.heightMultiplier * 2),
          Center(
            child: Text(
              AppLocalizations.of(context)!.noNotificationTitle,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
}
