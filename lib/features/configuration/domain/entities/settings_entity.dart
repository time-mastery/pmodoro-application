import "package:equatable/equatable.dart";

class SettingsEntity extends Equatable {
  final bool notification;
  final bool sound;
  final bool vibration;
  final bool appUpdates;
  final bool newTips;
  final bool ads;

  const SettingsEntity(
      {required this.notification,
      required this.sound,
      required this.vibration,
      required this.appUpdates,
      required this.newTips,
      required this.ads});

  @override
  List<Object?> get props =>
      [notification, sound, vibration, appUpdates, newTips, ads];
}
