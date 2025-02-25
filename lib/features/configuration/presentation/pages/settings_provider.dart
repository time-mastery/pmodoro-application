import "dart:async";

import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pomodore/core/services/database/storage.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part "settings_provider.g.dart";

@riverpod
FutureOr<void> logout(Ref ref) async {
  await FStorage.logout();
}
