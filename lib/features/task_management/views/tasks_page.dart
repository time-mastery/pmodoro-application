import "dart:developer";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pomodore/core/shared_widgets/base_app_bar.dart";

import "package:pomodore/features/task_management/models/task_model.dart";
import "package:pomodore/features/task_management/providers/task_management_providers.dart";
import "package:pomodore/features/task_management/views/add_task_page.dart";
import "../../../exports.dart";
import "shared/task_item.dart";

class TasksPage extends ConsumerWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations localization = AppLocalizations.of(context)!;
    final asyncTasks = ref.watch(tasksProvider);

    List<TaskModel> tasksList = [];

    asyncTasks.when(
      data: (data) {
        tasksList = data;
      },
      loading: () {},
      error: (error, stack) {},
    );

    return Scaffold(
      appBar: BaseAppBar(
        title: localization.tasksTitle,
        action: (tasksList.isNotEmpty)
            ? const Icon(CupertinoIcons.add_circled_solid)
            : null,
        onPressed: (tasksList.isNotEmpty)
            ? () => Navigator.pushNamed(context, AddTaskPage.routeName).then(
                  (_) {
                    final value = ref.refresh(tasksProvider.future);
                    log(value.toString());
                    // context.read<TasksBloc>()
                    //   ..add(
                    //     const AllTasksFetched(),
                    //   )
                    //   ..add(
                    //     TasksFiltered(
                    //       filterMode: TasksFilterEnum.all,
                    //       list: tasksList,
                    //     ),
                    //   );
                  },
                )
            : null,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(top: 20),
              itemCount: tasksList.length,
              itemBuilder: (context, index) => TaskItem(task: tasksList[index]),
              separatorBuilder: (BuildContext context, int index) {
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}

// class TasksPage extends StatelessWidget {
//   const TasksPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<TasksBloc>(
//       create: (context) => getIt.get<TasksBloc>()
//         ..add(
//           const AllTasksFetched(),
//         ),
//       child: const TaskView(),
//     );
//   }
// }

// class TaskView extends StatefulWidget {
//   const TaskView({super.key});

//   @override
//   State<TaskView> createState() => _TaskViewState();
// }

// class _TaskViewState extends State<TaskView> {
//   late List<TaskModel> tasksList;

//   @override
//   void initState() {
//     tasksList = [];
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final AppLocalizations localization = AppLocalizations.of(context)!;

//     return BlocConsumer<TasksBloc, TasksState>(
//       listener: (context, state) {
//         if (state is TaskCompleteSuccess ||
//             state is EditTaskSuccess ||
//             state is TaskDeleteSuccess) {
//           context.read<TasksBloc>().add(const AllTasksFetched());
//           Navigator.pop(context);
//         }

//         if (state is TaskCompleteFailure || state is TaskDeleteFailure) {
//           Navigator.pop(context);
//         }
//       },
//       builder: (context, state) {
//         if (state is GetAllTasksSuccess) {
//           tasksList = state.list;
//         }

//         return Scaffold(
//           appBar: BaseAppBar(
//             title: localization.tasksTitle,
//             action: (tasksList.isNotEmpty)
//                 ? const Icon(CupertinoIcons.add_circled_solid)
//                 : null,
//             onPressed: (tasksList.isNotEmpty)
//                 ? () =>
//                     Navigator.pushNamed(context, AddTaskPage.routeName).then(
//                       (_) {
//                         context.read<TasksBloc>()
//                           ..add(
//                             const AllTasksFetched(),
//                           )
//                           ..add(
//                             TasksFiltered(
//                               filterMode: TasksFilterEnum.all,
//                               list: tasksList,
//                             ),
//                           );
//                       },
//                     )
//                 : null,
//           ),
//           body: Column(
//             children: [
//               if (state is GetAllTasksSuccess && state.list.isEmpty)
//                 const DayWithoutTask(),
//               if (state is GetAllTasksFail) const Center(child: Text("error")),
//               if (state is GetAllTasksLoading) const GlobalIndicator(),
//               Expanded(
//                 child: ListView.separated(
//                   padding: const EdgeInsets.only(top: 20),
//                   itemCount: tasksList.length,
//                   itemBuilder: (context, index) =>
//                       TaskItem(task: tasksList[index]),
//                   separatorBuilder: (BuildContext context, int index) {
//                     return Container();
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
