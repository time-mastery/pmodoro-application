// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_management_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$uncompletedTasksHash() => r'160effefaea14b70d716fba040ffed010778166b';

/// See also [uncompletedTasks].
@ProviderFor(uncompletedTasks)
final uncompletedTasksProvider =
    AutoDisposeFutureProvider<List<TaskModel>>.internal(
  uncompletedTasks,
  name: r'uncompletedTasksProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$uncompletedTasksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UncompletedTasksRef = AutoDisposeFutureProviderRef<List<TaskModel>>;
String _$analysisHash() => r'32194af2ea25f842a2503b4ec3ee89f08677b967';

/// See also [Analysis].
@ProviderFor(Analysis)
final analysisProvider =
    AutoDisposeAsyncNotifierProvider<Analysis, AnalysisModel>.internal(
  Analysis.new,
  name: r'analysisProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$analysisHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Analysis = AutoDisposeAsyncNotifier<AnalysisModel>;
String _$homeHash() => r'24ce099084b1865f1d568278239fc31c39fa2fb9';

/// See also [Home].
@ProviderFor(Home)
final homeProvider =
    AutoDisposeAsyncNotifierProvider<Home, DailyInformationModel>.internal(
  Home.new,
  name: r'homeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$homeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Home = AutoDisposeAsyncNotifier<DailyInformationModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
