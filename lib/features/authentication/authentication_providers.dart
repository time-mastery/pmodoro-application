import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pomodore/features/authentication/authentication_repository.dart";

import "package:riverpod_annotation/riverpod_annotation.dart";

part "authentication_providers.g.dart";

@riverpod
class GenerateOTP extends _$GenerateOTP {
  @override
  FutureOr<bool> build() async {
    return false;
  }

  void generateOTP(String email) async {
    try {
      state = const AsyncValue.loading();
      await ref.read(authRepositoryProvider).generateOTP(email);
      state = const AsyncValue.data(true);
    } catch (e, s) {
      print(e);
      print(s);
      state = AsyncValue.error(e, s);
    }
  }
}
