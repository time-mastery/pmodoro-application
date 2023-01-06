part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();
}

class SettingsInitial extends SettingsState {
  @override
  List<Object> get props => [];
}

class SettingFetchingSuccess extends SettingsState {
  final SettingsEntity item;

  const SettingFetchingSuccess(this.item);

  @override
  List<Object?> get props => [item];
}

class SettingFetchingLoading extends SettingsState {
  @override
  List<Object?> get props => [];
}

class SettingFetchingFail extends SettingsState {
  @override
  List<Object?> get props => [];
}

class SettingsChangeSuccess extends SettingsState {
  final SettingsEntity item;

  const SettingsChangeSuccess(this.item);

  @override
  List<Object?> get props => [item];
}

class SettingsChangeLoading extends SettingsState {
  @override
  List<Object?> get props => [];
}

class SettingsChangeFail extends SettingsState {
  @override
  List<Object?> get props => [];
}
