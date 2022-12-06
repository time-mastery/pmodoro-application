import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodore/core/shared_widgets/base_app_bar.dart';
import 'package:pomodore/core/shared_widgets/custom_form_field.dart';
import 'package:pomodore/core/shared_widgets/global_button.dart';
import 'package:pomodore/core/shared_widgets/global_snack.dart';
import 'package:pomodore/di.dart';
import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';
import 'package:pomodore/features/task_management/presentation/blocs/tasks_bloc/tasks_bloc.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/shared_widgets/global_indicator.dart';
import '../../../../core/utils/utils.dart';
import '../../../../exports.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  static const routeName = "/addTask";

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => getIt.get<TasksBloc>(),
      child: AddTaskView(),
    );
  }
}

class AddTaskView extends StatelessWidget {
  const AddTaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;

    return BlocConsumer(
      bloc: context.read<TasksBloc>(),
      listener: (context, state) {
        if (state is TaskAddSuccess || state is TaskAddFail) {
          showSnackbar(context,
              title: (state is TaskAddSuccess) ? "Successful" : "Failure",
              color: AppConstant.primaryColor);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: BaseAppBar(
            title: localization.addNewTaskTitle,
            hasBackBtn: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  CustomFormField(
                    hint: localization.taskTitle,
                  ),
                  const SizedBox(height: 20),
                  CustomFormField(
                    hint: localization.dateTitle,
                  ),
                  const SizedBox(height: 20),
                  CustomFormField(hint: localization.categoryTitle),
                  const SizedBox(height: 20),
                  GlobalButton(
                    onPressed: () {
                      // todo : create a real item with data
                      context.read<TasksBloc>().add(TaskAdded(TaskEntity(
                            id: Utils.createUniqueId(),
                            title: 'Test',
                            description: 'This is a test',
                            deadLineTime: DateTime.now(),
                            doneTime: DateTime.now(),
                            done: false,
                          )));
                    },
                    child: (state is TaskAddLoading)
                        ? GlobalIndicator()
                        : Text(localization.submitTask),
                    backgroundColor: AppConstant.secondaryColor,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
