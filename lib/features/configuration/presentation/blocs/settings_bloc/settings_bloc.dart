import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pomodore/core/resources/params/settings_params.dart';
import 'package:pomodore/features/configuration/domain/entities/settings_entity.dart';

import '../../../domain/usecases/change_settings_usecase.dart';
import '../../../domain/usecases/get_settings_usecase.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetSettingsUseCase getSettingUseCase;
  final ChangeSettingsUseCase changeSettingsUseCase;

  SettingsBloc({
    required this.getSettingUseCase,
    required this.changeSettingsUseCase,
  }) : super(SettingsInitial()) {
    on<SettingsEvent>((event, emit) {});
    on<SettingsFromDeviceFetched>(_settingsFromDeviceFetched);
    on<SettingsChanged>(_settingsChanged);
  }

  _settingsChanged(SettingsChanged event, Emitter emit) async {
    emit(SettingsChangeLoading());
    Either<String, SettingsEntity> result =
        await changeSettingsUseCase.call(params: event.params);
    result.fold(
      (l) => emit(SettingsChangeFail()),
      (r) => emit(SettingsChangeSuccess(r)),
    );
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
