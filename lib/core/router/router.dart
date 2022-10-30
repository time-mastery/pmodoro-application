import 'package:flutter/material.dart';
import 'package:pomodore/features/base/presentation/pages/base_page.dart';

import '../../features/splash/presentation/pages/splash_page.dart';

class AppRouter {
  static Route<dynamic> onGenerationRouter(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case BasePage.routeName:
        return MaterialPageRoute(builder: (context) => const BasePage());
      default:
        return MaterialPageRoute(builder: (context) => const SplashPage());
    }
  }
}
