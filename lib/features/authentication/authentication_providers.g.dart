// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$timerStateHash() => r'56742b95a261ce17b5b62b3521e05e8fec46ba28';

/// See also [timerState].
@ProviderFor(timerState)
final timerStateProvider = AutoDisposeProvider<TimerState>.internal(
  timerState,
  name: r'timerStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$timerStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TimerStateRef = AutoDisposeProviderRef<TimerState>;
String _$expirationTimerHash() => r'7595f7564ccd99499806ac9396184fbaef310bcd';

/// See also [expirationTimer].
@ProviderFor(expirationTimer)
final expirationTimerProvider = AutoDisposeStreamProvider<int>.internal(
  expirationTimer,
  name: r'expirationTimerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$expirationTimerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ExpirationTimerRef = AutoDisposeStreamProviderRef<int>;
String _$generateOTPHash() => r'f1f0e8b5a35d82012803753df4e4981afa67ea28';

/// See also [GenerateOTP].
@ProviderFor(GenerateOTP)
final generateOTPProvider =
    AutoDisposeAsyncNotifierProvider<GenerateOTP, bool>.internal(
  GenerateOTP.new,
  name: r'generateOTPProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$generateOTPHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GenerateOTP = AutoDisposeAsyncNotifier<bool>;
String _$verifyOtpHash() => r'39e744736ca408364df153994f8de20e0d1e952c';

/// See also [VerifyOtp].
@ProviderFor(VerifyOtp)
final verifyOtpProvider =
    AutoDisposeAsyncNotifierProvider<VerifyOtp, bool>.internal(
  VerifyOtp.new,
  name: r'verifyOtpProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$verifyOtpHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VerifyOtp = AutoDisposeAsyncNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
