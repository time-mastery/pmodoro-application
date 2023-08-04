import "package:awesome_notifications/awesome_notifications.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:pomodore/core/services/database/storage.dart";
import "package:pomodore/core/services/notification/notification_custom_controller.dart";

class AppLocalNotification {
  Future notificationIsAllowedByUserOrNot() async {
    return (await FStorage.read(FStorage.notificationKey)) == "1";
  }

  Future shouldShowWelcomeNotification() async {
    return (await FStorage.read(FStorage.welcomeNotificationKey)) != "1";
  }

  void showedWelcomeNotification() async {
    await FStorage.write(FStorage.welcomeNotificationKey, "1");
  }

  Future initializeNotification() async {
    if (await notificationIsAllowedByUserOrNot()) {
      AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
        if (!isAllowed) {
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      });

      AwesomeNotifications().initialize(
        "resource://drawable/app_icon",
        [
          NotificationChannel(
            channelGroupKey: "basic_channel_group",
            channelKey: "basic_channel",
            channelName: "Basic notifications",
            channelDescription: "Notification channel for basic tests",
            importance: NotificationImportance.High,
            ledColor: Colors.white,
          )
        ],
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: "basic_channel_group",
              channelGroupName: "Basic group")
        ],
        debug: kDebugMode,
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

  void sendCustomNotification(String title, String body) async {
    final bool showNotification = (await notificationIsAllowedByUserOrNot());
    if (showNotification) {
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 10,
          channelKey: "basic_channel",
          title: title,
          body: body,
          autoDismissible: true,
          actionType: ActionType.Default,
        ),
      );
    }
  }
}
