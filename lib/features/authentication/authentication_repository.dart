import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pomodore/core/services/rest_api/rest_api.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
part "authentication_repository.g.dart";

@riverpod
AuthenticationRepository authenticationRepository(Ref ref) {
  return AuthenticationRepository(
    restApi: ref.read(restApiProvider),
  );
}

class AuthenticationRepository {
  final RestApi restApi;

  AuthenticationRepository({required this.restApi});

  Future<void> generateOTP(String email) async {}
  Future<void> verifyOTP(String email, String otp) async {}
}
