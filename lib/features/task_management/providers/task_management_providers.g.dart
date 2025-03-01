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
String _$saveDailyGoalHash() => r'4471391c223d9588b8bbb1020c8c8270937d1ba4';

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

/// See also [saveDailyGoal].
@ProviderFor(saveDailyGoal)
const saveDailyGoalProvider = SaveDailyGoalFamily();

/// See also [saveDailyGoal].
class SaveDailyGoalFamily extends Family<AsyncValue<void>> {
  /// See also [saveDailyGoal].
  const SaveDailyGoalFamily();

  /// See also [saveDailyGoal].
  SaveDailyGoalProvider call(
    int dailyGoal,
  ) {
    return SaveDailyGoalProvider(
      dailyGoal,
    );
  }

  @override
  SaveDailyGoalProvider getProviderOverride(
    covariant SaveDailyGoalProvider provider,
  ) {
    return call(
      provider.dailyGoal,
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
  String? get name => r'saveDailyGoalProvider';
}

/// See also [saveDailyGoal].
class SaveDailyGoalProvider extends AutoDisposeFutureProvider<void> {
  /// See also [saveDailyGoal].
  SaveDailyGoalProvider(
    int dailyGoal,
  ) : this._internal(
          (ref) => saveDailyGoal(
            ref as SaveDailyGoalRef,
            dailyGoal,
          ),
          from: saveDailyGoalProvider,
          name: r'saveDailyGoalProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveDailyGoalHash,
          dependencies: SaveDailyGoalFamily._dependencies,
          allTransitiveDependencies:
              SaveDailyGoalFamily._allTransitiveDependencies,
          dailyGoal: dailyGoal,
        );

  SaveDailyGoalProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dailyGoal,
  }) : super.internal();

  final int dailyGoal;

  @override
  Override overrideWith(
    FutureOr<void> Function(SaveDailyGoalRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveDailyGoalProvider._internal(
        (ref) => create(ref as SaveDailyGoalRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dailyGoal: dailyGoal,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SaveDailyGoalProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveDailyGoalProvider && other.dailyGoal == dailyGoal;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dailyGoal.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SaveDailyGoalRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `dailyGoal` of this provider.
  int get dailyGoal;
}

class _SaveDailyGoalProviderElement
    extends AutoDisposeFutureProviderElement<void> with SaveDailyGoalRef {
  _SaveDailyGoalProviderElement(super.provider);

  @override
  int get dailyGoal => (origin as SaveDailyGoalProvider).dailyGoal;
}

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
String _$dailyGoalHash() => r'1298a31b2154e179da944687a44179aedd2e99c6';

/// See also [DailyGoal].
@ProviderFor(DailyGoal)
final dailyGoalProvider =
    AutoDisposeAsyncNotifierProvider<DailyGoal, int>.internal(
  DailyGoal.new,
  name: r'dailyGoalProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dailyGoalHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DailyGoal = AutoDisposeAsyncNotifier<int>;
String _$timerTaskHash() => r'b33410f61a497519d095e52c3c58c2d49423e8a5';

/// See also [TimerTask].
@ProviderFor(TimerTask)
final timerTaskProvider =
    AutoDisposeNotifierProvider<TimerTask, TaskModel?>.internal(
  TimerTask.new,
  name: r'timerTaskProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$timerTaskHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TimerTask = AutoDisposeNotifier<TaskModel?>;
String _$tasksHash() => r'60cd380d72f331a6e7e7252ddc2b7efe17808809';

/// See also [Tasks].
@ProviderFor(Tasks)
final tasksProvider =
    AutoDisposeAsyncNotifierProvider<Tasks, List<TaskModel>>.internal(
  Tasks.new,
  name: r'tasksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tasksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Tasks = AutoDisposeAsyncNotifier<List<TaskModel>>;
String _$addTaskHash() => r'a14fa88c1bc504fa2c6304bf6b717e0a00c7268e';

/// See also [AddTask].
@ProviderFor(AddTask)
final addTaskProvider =
    AutoDisposeAsyncNotifierProvider<AddTask, bool>.internal(
  AddTask.new,
  name: r'addTaskProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$addTaskHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddTask = AutoDisposeAsyncNotifier<bool>;
String _$editTaskHash() => r'53bf488fa059097108ccd1cee470f5255f3afcf4';

/// See also [EditTask].
@ProviderFor(EditTask)
final editTaskProvider =
    AutoDisposeAsyncNotifierProvider<EditTask, bool>.internal(
  EditTask.new,
  name: r'editTaskProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$editTaskHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EditTask = AutoDisposeAsyncNotifier<bool>;
String _$deleteTaskHash() => r'a8c11a9e65aebad9482c2eef208dc8a1b781e8c2';

/// See also [DeleteTask].
@ProviderFor(DeleteTask)
final deleteTaskProvider =
    AutoDisposeAsyncNotifierProvider<DeleteTask, bool>.internal(
  DeleteTask.new,
  name: r'deleteTaskProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$deleteTaskHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DeleteTask = AutoDisposeAsyncNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
