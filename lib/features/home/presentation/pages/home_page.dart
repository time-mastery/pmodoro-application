import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pomodore/core/constant/constant.dart';
import 'package:pomodore/core/utils/size_config.dart';
import 'package:pomodore/core/widgets/base_app_bar.dart';
import 'package:pomodore/features/home/presentation/pages/all_today_tasks_page.dart';
import 'package:pomodore/features/home/presentation/widgets/home_task_item.dart';

import '../../../../exports.dart';
import 'notifications_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;
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
            Center(
              child: Text(
                localization.welcomeTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Container(
              width: SizeConfig.widthMultiplier * 100,
              height: SizeConfig.heightMultiplier * 20,
              decoration: BoxDecoration(
                color: AppConstant.swatchColor.withOpacity(.09),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 20,
                      height: SizeConfig.widthMultiplier * 20,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: SizeConfig.widthMultiplier * 20,
                              height: SizeConfig.widthMultiplier * 20,
                              child: CircularProgressIndicator(
                                value: .7,
                                strokeWidth: 10,
                                backgroundColor:
                                    AppConstant.swatchColor.withOpacity(.2),
                                color: AppConstant.swatchColor,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "75 %",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: SizeConfig.widthMultiplier * 4),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            localization.dailyTasksDoneTitle,
                            style: Theme.of(context).textTheme.titleLarge,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: SizeConfig.heightMultiplier * 2),
                          Text(
                            localization.completedTasks
                                .replaceFirst("{d}", "12")
                                .replaceFirst("{a}", "16"),
                            style: Theme.of(context).textTheme.bodySmall,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  localization.todayTasks.replaceAll("#", "16"),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, AllTodayTasksPage.routeName),
                  child: Text(
                    localization.seeAllTitle,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: AppConstant.swatchColor),
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => HomeTaskItem(
                  title: "Task $index",
                  time: index,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
