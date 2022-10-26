import 'package:flutter/material.dart';
import 'package:pomodore/features/home/presentation/pages/home_page.dart';

import '../../features/splash/presentation/pages/splash_page.dart';

class AppRouter {
  static Route<dynamic> onGenerationRouter(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(builder: (context) => const HomePage());
      default:
        return MaterialPageRoute(builder: (context) => const SplashPage());
    }
  }
}
