enum ApiPath {
  generateOtp("/auth/generate-otp"),
  verifyOtp("/auth/verify-otp"),
  refreshToken("/auth/refresh-token"),
  googleAuth("/auth/google/login"),
  googleAuthCallback("/auth/google/callback"),
  ;

  final String value;
  const ApiPath(this.value);
}
