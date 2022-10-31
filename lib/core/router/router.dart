import 'package:flutter/material.dart';
import 'package:pomodore/features/base/presentation/pages/base_page.dart';
import 'package:pomodore/features/home/presentation/pages/all_today_tasks_page.dart';
import 'package:pomodore/features/home/presentation/pages/notifications_page.dart';

import '../../features/splash/presentation/pages/splash_page.dart';

class AppRouter {
  static Route<dynamic> onGenerationRouter(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case BasePage.routeName:
        return MaterialPageRoute(builder: (context) => const BasePage());
      case NotificationsPage.routeName:
        return MaterialPageRoute(
            builder: (context) => const NotificationsPage());
      case AllTodayTasksPage.routeName:
        return MaterialPageRoute(
            builder: (context) => const AllTodayTasksPage());
      default:
        return MaterialPageRoute(builder: (context) => const SplashPage());
    }
  }
}
