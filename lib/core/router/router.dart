import "package:flutter/material.dart";
import "package:pomodore/features/notification_management/presentation/pages/notifications_page.dart";
import "package:pomodore/features/task_management/domain/entities/task_entity.dart";
import "package:pomodore/features/task_management/presentation/pages/add_category_page.dart";
import "package:pomodore/features/task_management/presentation/pages/add_task_page.dart";
import "package:pomodore/features/task_management/presentation/pages/all_today_tasks_page.dart";
import "package:pomodore/features/task_management/presentation/pages/analysis_page.dart";
import "package:pomodore/features/task_management/presentation/pages/edit_task_page.dart";

import "../../features/configuration/presentation/pages/base_page.dart";
import "../../features/configuration/presentation/pages/splash_page.dart";

class AppRouter {
  static Route<dynamic> onGenerationRouter(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case BasePage.routeName:
        return MaterialPageRoute(builder: (context) => BasePage());
      case NotificationsPage.routeName:
        return MaterialPageRoute(
            builder: (context) => const NotificationsPage());
      case AllTodayTasksPage.routeName:
        return MaterialPageRoute(
            builder: (context) => const AllTodayTasksPage());
      case AnalysisPage.routeName:
        return MaterialPageRoute(builder: (context) => const AnalysisPage());
      case AddTaskPage.routeName:
        return MaterialPageRoute(builder: (context) => const AddTaskPage());
      case AddCategoryPage.routeName:
        return MaterialPageRoute(builder: (context) => const AddCategoryPage());
      case EditTaskPage.routeName:
        return MaterialPageRoute(
            builder: (context) =>
                EditTaskPage(task: routeSettings.arguments as TaskEntity));
      default:
        return MaterialPageRoute(builder: (context) => const SplashPage());
    }
  }
}
