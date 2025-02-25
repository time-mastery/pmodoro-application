import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pomodore/core/services/database/storage.dart";
import "package:pomodore/features/authentication/views/login_page.dart";
import "package:pomodore/features/configuration/presentation/pages/base_page.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part "splash_provider.g.dart";

@riverpod
FutureOr<String> checkForSplashNavigationPath(Ref ref) async {
  final userAuthenticated = await FStorage.checkUserAuthState();
  return userAuthenticated ? BasePage.routeName : LoginPage.routeName;
}
