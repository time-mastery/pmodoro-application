import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pomodore/core/constant/constant.dart';
import 'package:pomodore/core/shared_widgets/base_app_bar.dart';
import 'package:pomodore/core/shared_widgets/global_indicator.dart';
import 'package:pomodore/core/utils/size_config.dart';
import 'package:pomodore/features/configuration/presentation/blocs/base_bloc/base_bloc.dart';
import 'package:pomodore/features/task_management/domain/entities/daily_information_entity.dart';
import 'package:pomodore/features/task_management/presentation/blocs/home_bloc/home_bloc.dart';

import '../../../../di.dart';
import '../../../../exports.dart';
import '../../../notification_management/presentation/pages/notifications_page.dart';
import '../../domain/entities/task_entity.dart';
import '../widgets/home_task_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<HomeBloc>()..add(HomeDataFetched(DateTime.now())),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;
    List<TaskEntity> list = [];
    DailyInformationEntity? dailyItem;
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
                child: BlocBuilder(
                  bloc: context.read<HomeBloc>(),
                  builder: (context, state) {
                    if (state is FetchHomeDataSuccess) dailyItem = state.item;
                    return Row(
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
                                    value: dailyItem?.processPercentage ?? 0,
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
                                  "${dailyItem?.processPercentage.toString() ?? "0.0"} %",
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
                                dailyItem == null
                                    ? "- - - - - -"
                                    : localization.completedTasks(
                                        dailyItem!.taskQuantity.toString(),
                                        dailyItem!.completedTaskQuantity
                                            .toString()),
                                style: Theme.of(context).textTheme.bodySmall,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            BlocBuilder(
              bloc: context.read<HomeBloc>(),
              builder: (context, state) {
                return Text(
                  localization.todayTasks.replaceAll(
                      "#",
                      ((state is FetchHomeDataSuccess)
                          ? state.list.length.toString()
                          : "-")),
                  style: Theme.of(context).textTheme.titleLarge,
                );
              },
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            BlocBuilder(
              bloc: context.read<HomeBloc>(),
              builder: (context, state) {
                if (state is FetchHomeDataLoading) {
                  return const Center(child: GlobalIndicator());
                }

                if (state is FetchHomeDataSuccess) {
                  list = state.list;
                }

                if (state is FetchHomeDataSuccess && list.isEmpty) {
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          localization.emptyTaskListTitle,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: Colors.cyanAccent),
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 2,
                        ),
                        Text(
                          localization.emptyTaskListHint,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier * 2,
                        ),
                        IconButton(
                          onPressed: () => getIt
                              .get<BaseBloc>()
                              .add(const PageIndexChanged(1)),
                          icon: const Icon(CupertinoIcons.add_circled_solid),
                        ),
                      ],
                    ),
                  );
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) =>
                        HomeTaskItem(item: list[index]),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
