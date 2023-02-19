import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:pomodore/core/services/database/storage.dart';
import 'package:pomodore/core/services/notification/notification_custom_controller.dart';

class AppLocalNotification {
  Future notificationIsAllowedByUserOrNot() async {
    return (await FStorage.read(FStorage.notificationKey)) == "1";
  }

  void initializeNotification() async {
    if (await notificationIsAllowedByUserOrNot()) {
      AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
        if (!isAllowed) {
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      });

      AwesomeNotifications().initialize(
        'resource://drawable/res_app_icon',
        [
          NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: const Color(0xFF9D50DD),
            ledColor: Colors.white,
          )
        ],
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: 'basic_channel_group',
              channelGroupName: 'Basic group')
        ],
        debug: true,
      );

      AwesomeNotifications().setListeners(
        onActionReceivedMethod:
            NotificationCustomController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationCustomController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationCustomController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationCustomController.onDismissActionReceivedMethod,
      );
    }
  }

  void sendNotification() async {
    if ((await notificationIsAllowedByUserOrNot())) {
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 10,
          channelKey: 'basic_channel',
          title: 'Simple Notification',
          body: 'Simple body',
          actionType: ActionType.Default,
        ),
      );
    }
  }
}
