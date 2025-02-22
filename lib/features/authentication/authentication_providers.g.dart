// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$generateOTPHash() => r'aa64e0609e5e0411ef3a669585ab4e8845a48298';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [generateOTP].
@ProviderFor(generateOTP)
const generateOTPProvider = GenerateOTPFamily();

/// See also [generateOTP].
class GenerateOTPFamily extends Family<AsyncValue<void>> {
  /// See also [generateOTP].
  const GenerateOTPFamily();

  /// See also [generateOTP].
  GenerateOTPProvider call(
    String email,
  ) {
    return GenerateOTPProvider(
      email,
    );
  }

  @override
  GenerateOTPProvider getProviderOverride(
    covariant GenerateOTPProvider provider,
  ) {
    return call(
      provider.email,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'generateOTPProvider';
}

/// See also [generateOTP].
class GenerateOTPProvider extends AutoDisposeFutureProvider<void> {
  /// See also [generateOTP].
  GenerateOTPProvider(
    String email,
  ) : this._internal(
          (ref) => generateOTP(
            ref as GenerateOTPRef,
            email,
          ),
          from: generateOTPProvider,
          name: r'generateOTPProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$generateOTPHash,
          dependencies: GenerateOTPFamily._dependencies,
          allTransitiveDependencies:
              GenerateOTPFamily._allTransitiveDependencies,
          email: email,
        );

  GenerateOTPProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
  }) : super.internal();

  final String email;

  @override
  Override overrideWith(
    FutureOr<void> Function(GenerateOTPRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GenerateOTPProvider._internal(
        (ref) => create(ref as GenerateOTPRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _GenerateOTPProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GenerateOTPProvider && other.email == email;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GenerateOTPRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `email` of this provider.
  String get email;
}

class _GenerateOTPProviderElement extends AutoDisposeFutureProviderElement<void>
    with GenerateOTPRef {
  _GenerateOTPProviderElement(super.provider);

  @override
  String get email => (origin as GenerateOTPProvider).email;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
