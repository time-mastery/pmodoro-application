import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";
import "package:pomodore/core/resources/params/task_params.dart";

import "../../../../core/constant/constant.dart";
import "../../../../core/shared_widgets/base_app_bar.dart";
import "../../../../core/shared_widgets/custom_form_field.dart";
import "../../../../core/shared_widgets/global_button.dart";
import "../../../../core/shared_widgets/global_indicator.dart";
import "../../../../core/shared_widgets/global_snack.dart";
import "../../../../core/utils/responsive/size_config.dart";
import "../../../../di.dart";
import "../../../../exports.dart";
import "../../domain/entities/task_entity.dart";
import "../blocs/tasks_bloc/tasks_bloc.dart";

class EditTaskPage extends StatelessWidget {
  const EditTaskPage({Key? key, required this.task}) : super(key: key);

  static const routeName = "/editTask";

  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt.get<TasksBloc>(),
      child: EditTaskView(
        task: task,
      ),
    );
  }
}

class EditTaskView extends HookWidget {
  const EditTaskView({Key? key, required this.task}) : super(key: key);

  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;

    final titleController = useTextEditingController(text: task.title);
    final descriptionController =
        useTextEditingController(text: task.description);
    final formKey = useState(GlobalKey<FormState>());
    final dateTime = useState<DateTime?>(task.deadLineTime);

    return BlocConsumer(
      bloc: context.read<TasksBloc>(),
      listener: (context, state) {
        if (state is EditTaskFailure) {
          showSnackBar(
            context,
            title: localization.failureTitle,
          );
        }
        if (state is EditTaskSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: BaseAppBar(
            title: localization.addNewTaskTitle,
            hasBackBtn: true,
          ),
          body: Form(
            key: formKey.value,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CustomFormField(
                      validatorsType: "length",
                      editController: titleController,
                      hint: localization.taskTitle,
                    ),
                    20.spaceH(),
                    CustomFormField(
                      validatorsType: "length",
                      editController: descriptionController,
                      hint: localization.taskDescription,
                    ),
                    20.spaceH(),
                    BlocConsumer<TasksBloc, TasksState>(
                      listener: (context, state) {
                        if (state is AddDateSuccess) {
                          dateTime.value = state.dateTime;
                        }
                      },
                      builder: (context, state) {
                        if (dateTime.value != null) {
                          return Row(
                            children: [
                              Text(
                                "${localization.dateTitle} : ",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(dateTime.value.toString()),
                            ],
                          );
                        }
                        return Container();
                      },
                    ),
                    20.spaceH(),
                    Container(
                      height: SizeConfig.heightMultiplier * 5,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.onBackground),
                        borderRadius: BorderRadius.circular(AppConstant.radius),
                      ),
                      child: TextButton(
                        onPressed: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (_) => Container(
                              height: 500,
                              color: Theme.of(context).colorScheme.background,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 400,
                                    child: CupertinoDatePicker(
                                        use24hFormat: true,
                                        initialDateTime: DateTime.now(),
                                        onDateTimeChanged: (val) {
                                          context
                                              .read<TasksBloc>()
                                              .add(DateAdded(val));
                                          dateTime.value = val;
                                        }),
                                  ),

                                  // Close the modal
                                  CupertinoButton(
                                    child: const Text("OK"),
                                    onPressed: () {
                                      if (dateTime.value == null) {
                                        context
                                            .read<TasksBloc>()
                                            .add(DateAdded(DateTime.now()));
                                        dateTime.value = DateTime.now();
                                      }
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          "Select Deadline Datetime",
                        ),
                      ),
                    ),
                    20.spaceH(),
                    GlobalButton(
                      onPressed: () {
                        if (formKey.value.currentState!.validate()) {
                          if (dateTime.value == null) {
                            showSnackBar(context,
                                title: "Please select a datetime");
                          } else {
                            context.read<TasksBloc>().add(
                                  TaskEdited(
                                    TaskParams(
                                      uid: task.uid,
                                      taskDateTimeDeadline: task.deadLineTime,
                                      taskDescription: task.description,
                                      taskTitle: task.title,
                                      taskDone: false,
                                      id: task.id,
                                      taskDoneDatetime: task.doneTime,
                                    ),
                                  ),
                                );
                          }
                        }
                      },
                      child: (state is TaskAddLoading)
                          ? const GlobalIndicator()
                          : Text(localization.submitTask),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
