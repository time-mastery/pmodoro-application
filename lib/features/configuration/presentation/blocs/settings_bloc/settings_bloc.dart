import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pomodore/features/configuration/domain/entities/settings_entity.dart';

import '../../../domain/usecases/get_settings_usecase.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetSettingsUseCase getSettingUseCase;

  SettingsBloc({required this.getSettingUseCase}) : super(SettingsInitial()) {
    on<SettingsEvent>((event, emit) {});
    on<SettingsFromDeviceFetched>(_settingsFromDeviceFetched);
  }

  _settingsFromDeviceFetched(
      SettingsFromDeviceFetched event, Emitter emit) async {
    emit(SettingFetchingLoading());

    Either<String, SettingsEntity> result = await getSettingUseCase.call();

    result.fold(
      (l) => emit(SettingFetchingFail()),
      (r) => emit(SettingFetchingSuccess(r)),
    );
  }
}
