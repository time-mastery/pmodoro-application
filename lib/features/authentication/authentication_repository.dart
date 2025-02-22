import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pomodore/core/resources/enums/api_path_enums.dart";
import "package:pomodore/core/services/rest_api/rest_api.dart";
import "package:pomodore/features/authentication/models/verify_otp_model.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
part "authentication_repository.g.dart";

@riverpod
AuthenticationRepository authRepository(Ref ref) {
  final restApi = ref.read(restApiProvider);
  return AuthenticationRepository(
    restApi: restApi,
  );
}

class AuthenticationRepository {
  final RestApi restApi;

  AuthenticationRepository({required this.restApi});

  Future<void> generateOTP(String email) async {
    try {
      final response =
          await restApi.post(ApiPath.generateOtp.value, data: {"email": email});

      if (response.statusCode != 200) {
        throw Exception("Failed to generate OTP");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<VerifyOtpModel> verifyOTP(String email, String otp) async {
    try {
      final response = await restApi
          .post(ApiPath.verifyOtp.value, data: {"email": email, "otp": otp});

      if (response.statusCode != 200) {
        throw Exception("Failed to verify OTP");
      }

      return VerifyOtpModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
