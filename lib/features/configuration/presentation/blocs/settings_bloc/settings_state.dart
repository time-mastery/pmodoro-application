part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();
}

class SettingsInitial extends SettingsState {
  @override
  List<Object> get props => [];
}

class SettingFetchingSuccess extends SettingsState {
  @override
  List<Object?> get props => [];
}

class SettingFetchingLoading extends SettingsState {
  @override
  List<Object?> get props => [];
}

class SettingFetchingFail extends SettingsState {
  @override
  List<Object?> get props => [];
}
