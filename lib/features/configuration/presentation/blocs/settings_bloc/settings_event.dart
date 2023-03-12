part of "settings_bloc.dart";

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
}

class SettingsFromDeviceFetched extends SettingsEvent {
  @override
  List<Object?> get props => [];
}

class InitDataFetched extends SettingsEvent {
  @override
  List<Object?> get props => [];
}

class SettingsChanged extends SettingsEvent {
  final ChangeSettingsParams params;

  const SettingsChanged(this.params);

  @override
  List<Object?> get props => [params];

  @override
  String toString() {
    return "SettingsChanged{params: $params}";
  }
}

class LocaleChanged extends SettingsEvent {
  final String local;

  const LocaleChanged(this.local);

  @override
  List<Object?> get props => [local];
}

class ThemeChanged extends SettingsEvent {
  final ThemeParams themeParams;

  const ThemeChanged(this.themeParams);

  @override
  List<Object?> get props => [themeParams];
}
