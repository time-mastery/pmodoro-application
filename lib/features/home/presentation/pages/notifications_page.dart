import 'package:flutter/material.dart';
import 'package:pomodore/core/constant/constant.dart';
import 'package:pomodore/core/widgets/base_app_bar.dart';
import 'package:pomodore/features/home/presentation/widgets/notificaiton_item.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  static const routeName = "/notifications";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: AppConstant.notificationsTitle,
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
