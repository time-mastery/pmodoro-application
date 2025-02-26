import "dart:developer";

import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_web_auth_2/flutter_web_auth_2.dart";
import "package:pomodore/core/resources/enums/api_path_enums.dart";
import "package:pomodore/core/services/database/storage.dart";
import "package:pomodore/core/services/rest_api/rest_api.dart";
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

@riverpod
class GoogleAuth extends _$GoogleAuth {
  @override
  Future<void> build() async {
    final RestApi restApi = ref.read(restApiProvider);
    final baseUrl = dotenv.env["API"] ?? "";
    final scheme = dotenv.env["SCHEME"] ?? "";

    final result = await FlutterWebAuth2.authenticate(
      url: baseUrl + ApiPath.googleAuth.value,
      callbackUrlScheme: scheme,
    );

    final uri = Uri.parse(result);
    final code = uri.queryParameters["code"];
    final state = uri.queryParameters["state"];
    final scope = uri.queryParameters["scope"];
    final authUser = uri.queryParameters["authuser"];
    final prompt = uri.queryParameters["prompt"];

    if (code == null) {
      print("No authorization code received");
      return Future.error("No authorization code received");
    }

    final response = await restApi.get(
      ApiPath.googleAuthCallback.value,
      queryParameters: {
        "code": code,
        "state": state,
        "scope": scope,
        "authuser": authUser,
        "prompt": prompt,
      },
    );

    if (response.statusCode != 200) {
      print("Error: ${response.data}");
      return Future.error("Error: ${response.data}");
    } else {
      final tokens = response.data["tokens"];
      final accessToken = tokens["access_token"];
      final refreshToken = tokens["refresh_token"];
      final user = response.data["user"];
      final uuid = user["uuid"];
      final email = user["email"];

      await FStorage.writeEmail(email);
      await FStorage.writeUuid(uuid);
      await FStorage.writeAccessToken(accessToken);
      await FStorage.writeRefreshToken(refreshToken);

      return;
    }
  }
}
