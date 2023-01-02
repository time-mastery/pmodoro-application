import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<SettingsEvent>((event, emit) {});
    on<SettingsFromDeviceFetched>(_settingsFromDeviceFetched);
  }

  _settingsFromDeviceFetched(SettingsFromDeviceFetched event, Emitter emit) {}
}
