import "dart:developer";

import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pomodore/core/services/database/storage.dart";
import "package:pomodore/features/authentication/authentication_repository.dart";

import "package:riverpod_annotation/riverpod_annotation.dart";

part "authentication_providers.g.dart";

enum TimerState { inProgress, finished }

@riverpod
TimerState timerState(Ref ref) {
  final timerValue = ref.watch(expirationTimerProvider).value;

  return timerValue != 0 ? TimerState.inProgress : TimerState.finished;
}

@riverpod
Stream<int> expirationTimer(Ref ref) async* {
  for (var i = 300; i >= 0; i--) {
    yield i;
    await Future<void>.delayed(const Duration(seconds: 1));
  }
}

@riverpod
class GenerateOTP extends _$GenerateOTP {
  @override
  FutureOr<bool> build() async {
    return false;
  }

  Future<void> generateOTP(String email) async {
    try {
      state = const AsyncValue.loading();
      await ref.read(authRepositoryProvider).generateOTP(email);
      state = const AsyncValue.data(true);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}

@riverpod
class VerifyOtp extends _$VerifyOtp {
  @override
  FutureOr<bool> build() async {
    return false;
  }

  Future<void> submitRecievedOTP(String email, String otp) async {
    try {
      state = const AsyncValue.loading();

      final repo = ref.read(authRepositoryProvider);
      await repo.verifyOTP(email, otp);

      state = const AsyncValue.data(true);
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      state = AsyncValue.error(e, s);
    }
  }
}
