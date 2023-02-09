import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pomodore/core/resources/params/settings_params.dart';
import 'package:pomodore/features/configuration/domain/entities/settings_entity.dart';

import '../../../domain/usecases/change_locale_usecase.dart';
import '../../../domain/usecases/change_settings_usecase.dart';
import '../../../domain/usecases/get_locale_usecase.dart';
import '../../../domain/usecases/get_settings_usecase.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetSettingsUseCase getSettingUseCase;
  final ChangeSettingsUseCase changeSettingsUseCase;
  final ChangeLocaleUseCase changeLocaleUseCase;
  final GetLocaleUseCase getLocaleUseCase;

  SettingsBloc({
    required this.getSettingUseCase,
    required this.changeSettingsUseCase,
    required this.changeLocaleUseCase,
    required this.getLocaleUseCase,
  }) : super(SettingsInitial()) {
    on<SettingsEvent>((event, emit) {});
    on<LocaleFetched>(_localeFetched);
    on<SettingsFromDeviceFetched>(_settingsFromDeviceFetched);
    on<SettingsChanged>(_settingsChanged);
    on<LocaleChanged>(_languageChanged);
  }

  _localeFetched(LocaleFetched event, Emitter emit) async {
    Either<String, String> result = await getLocaleUseCase.call();
    result.fold((l) => emit(FetchLocaleFailure()),
        (r) => emit(FetchLocaleSuccess(Locale(r))));
  }

  _settingsChanged(SettingsChanged event, Emitter emit) async {
    emit(SettingFetchingLoading());
    Either<String, SettingsEntity> result =
        await changeSettingsUseCase.call(params: event.params);
    result.fold(
      (l) => emit(SettingFetchingFail()),
      (r) => emit(SettingFetchingSuccess(r)),
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

  _languageChanged(LocaleChanged event, Emitter emit) async {
    Either<String, String> result =
        await changeLocaleUseCase.call(params: event.local);
    emit(ChangeLanguageSuccess(Locale(event.local)));
  }
}
