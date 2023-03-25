import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";
import "package:pomodore/core/shared_widgets/global_indicator.dart";
import "package:pomodore/core/utils/responsive/size_config.dart";
import "package:pomodore/features/configuration/presentation/blocs/base_bloc/base_bloc.dart";
import "package:pomodore/features/task_management/presentation/blocs/home_bloc/home_bloc.dart";

import "../../../../../di.dart";
import "../../../../../exports.dart";
import "../../../domain/entities/task_entity.dart";
import "../../widgets/home_task_item.dart";

class HomeTasksList extends StatelessWidget {
  const HomeTasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;
    List<TaskEntity> list = [];

    return BlocBuilder(
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
                Text(localization.emptyTaskListTitle,
                    style: Theme.of(context).textTheme.headlineSmall),
                (SizeConfig.heightMultiplier * 2).spaceH(),
                Text(
                  localization.emptyTaskListHint,
                  textAlign: TextAlign.center,
                ),
                (SizeConfig.heightMultiplier * 2).spaceH(),
                IconButton(
                  onPressed: () =>
                      getIt.get<BaseBloc>().add(const PageIndexChanged(1)),
                  icon: const Icon(CupertinoIcons.add_circled_solid),
                ),
              ],
            ),
          );
        }

        return Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) => HomeTaskItem(item: list[index]),
          ),
        );
      },
    );
  }
}
