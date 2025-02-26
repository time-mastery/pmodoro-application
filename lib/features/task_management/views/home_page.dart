import "package:flutter/material.dart";

import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:ionicons/ionicons.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";
import "package:pomodore/core/shared_widgets/base_app_bar.dart";

import "package:pomodore/core/utils/responsive/size_config.dart";

import "../../../exports.dart";
import "../../notification_management/views/notifications_page.dart";
import "home_widgets/home_goal_widget.dart";
import "home_widgets/home_task_count_widget.dart";
import "home_widgets/home_tasks_list.dart";

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations localization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: BaseAppBar(
        title: localization.homeTitle,
        action: const Icon(Ionicons.notifications),
        onPressed: () =>
            Navigator.pushNamed(context, NotificationsPage.routeName),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (SizeConfig.heightMultiplier * 2).spaceH(),
              const HomeGoalWidget(),
              (SizeConfig.heightMultiplier * 2).spaceH(),
              const HomeTaskCountWidget(),
              (SizeConfig.heightMultiplier * 2).spaceH(),
              const HomeTasksList(),
            ],
          )),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => getIt.get<HomeBloc>()..add(DailyGoalChecked()),
//       child: const HomeView(),
//     );
//   }
// }

// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final AppLocalizations localization = AppLocalizations.of(context)!;
//     return Scaffold(
//       appBar: BaseAppBar(
//         title: localization.homeTitle,
//         action: const Icon(Ionicons.notifications),
//         onPressed: () =>
//             Navigator.pushNamed(context, NotificationsPage.routeName),
//       ),
//       body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               (SizeConfig.heightMultiplier * 2).spaceH(),
//               const HomeGoalWidget(),
//               (SizeConfig.heightMultiplier * 2).spaceH(),
//               const HomeTaskCountWidget(),
//               (SizeConfig.heightMultiplier * 2).spaceH(),
//               const HomeTasksList(),
//             ],
//           )
//           // BlocConsumer<HomeBloc, HomeState>(
//           //   listener: (context, state) {
//           //     if (state is CheckDailyGoalSuccess) {
//           //       if (state.dailyGoalSubmitted == false) {
//           //         showDailyGoalDialog(context, context.read<HomeBloc>());
//           //       } else {
//           //         context.read<HomeBloc>().add(HomeDataFetched(DateTime.now()));
//           //       }
//           //     } else if (state is SaveDailyGoalSuccess) {
//           //       Navigator.pop(context);
//           //       context.read<HomeBloc>().add(HomeDataFetched(DateTime.now()));
//           //     }
//           //   },
//           //   builder: (context, state) {
//           //     if (state is CheckDailyGoalLoading ||
//           //         state is FetchHomeDataLoading) {
//           //       return Center(
//           //         child: GlobalIndicator(
//           //             color: Theme.of(context).colorScheme.primary),
//           //       );
//           //     }
//           //     return ;
//           //   },
//           // ),
//           ),
//     );
//   }
// }
