import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pomodore/features/authentication/authentication_repository.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part "authentication_providers.g.dart";

@riverpod
FutureOr<void> generateOTP(Ref ref, String email) {
  return ref.read(authenticationRepositoryProvider).generateOTP(email);
}
