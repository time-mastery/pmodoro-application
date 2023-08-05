import "dart:math";

import "package:awesome_notifications/awesome_notifications.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:pomodore/core/services/database/storage.dart";
import "package:pomodore/core/services/notification/notification_custom_controller.dart";

import "../../utils/utils.dart";

const defaultChannelGroupKey = "basic_channel_group";
const channelGroupName = "Basic group";
const channelKey = "basic_channel";
const channelName = "Basic notifications";
const channelDescription = "Notification channel for basic tests";

const backgroundChannelGroupKey = "background_channel_group";
const backgroundGroupName = "background group";
const backgroundChannelKey = "background_channel";
const backgroundChannelName = "background notification";
const backgroundChannelDescription = "notification for background channel";

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
            channelGroupKey: defaultChannelGroupKey,
            channelKey: channelKey,
            channelName: channelName,
            channelDescription: channelDescription,
            importance: NotificationImportance.High,
            ledColor: Colors.white,
            enableVibration: true,
            playSound: true,
          ),
          NotificationChannel(
            channelKey: backgroundChannelKey,
            channelName: backgroundChannelName,
            channelDescription: backgroundChannelDescription,
            importance: NotificationImportance.Low,
            playSound: false,
            onlyAlertOnce: true,
            enableVibration: false,
          ),
        ],
        channelGroups: [
          NotificationChannelGroup(
            channelGroupKey: defaultChannelGroupKey,
            channelGroupName: channelGroupName,
          ),
          NotificationChannelGroup(
            channelGroupKey: backgroundChannelGroupKey,
            channelGroupName: backgroundGroupName,
          )
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
          id: Random().nextInt(100),
          channelKey: channelKey,
          title: title,
          body: body,
          autoDismissible: true,
          actionType: ActionType.Default,
        ),
      );
    }
  }

  void sendBackgroundNotification(int duration) async {
    final bool showNotification = (await notificationIsAllowedByUserOrNot());
    if (showNotification) {
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 0,
          channelKey: backgroundChannelKey,
          groupKey: backgroundChannelGroupKey,
          title: "Timer in progress",
          body:
              Utils.formatSecToMinSecForBgNotification(timeInSecond: duration),
          autoDismissible: true,
          notificationLayout: NotificationLayout.ProgressBar,
          actionType: ActionType.KeepOnTop,
        ),
      );
    }
  }

  void closeBackgroundNotification(int id) async {
    await AwesomeNotifications().cancel(id);
  }
}
