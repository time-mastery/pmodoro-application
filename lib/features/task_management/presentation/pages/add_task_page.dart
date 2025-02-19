import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";
import "package:pomodore/core/shared_widgets/base_app_bar.dart";
import "package:pomodore/core/shared_widgets/custom_form_field.dart";
import "package:pomodore/core/shared_widgets/global_button.dart";
import "package:pomodore/core/shared_widgets/global_snack.dart";
import "package:pomodore/features/task_management/domain/entities/task_entity.dart";
import "package:pomodore/features/task_management/presentation/blocs/tasks_bloc/tasks_bloc.dart";
import "package:uuid/uuid.dart";

import "../../../../core/constant/constant.dart";
import "../../../../core/resources/params/task_params.dart";
import "../../../../core/shared_widgets/global_indicator.dart";
import "../../../../core/utils/responsive/size_config.dart";
import "../../../../di.dart";
import "../../../../exports.dart";

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key, this.editItem});

  static const routeName = "/addTask";

  final TaskEntity? editItem;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => getIt.get<TasksBloc>(),
        child: const AddTaskView());
  }
}

class AddTaskView extends HookWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final formKey = useState(GlobalKey<FormState>());
    final dateTime = useState<DateTime?>(null);

    return BlocConsumer(
      bloc: context.read<TasksBloc>(),
      listener: (context, state) {
        if (state is TaskAddFailure) {
          showSnackBar(
            context,
            title: localization.failureTitle,
          );
        }
        if (state is TaskAddSuccess) {
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
                            color: Theme.of(context).colorScheme.onSurface),
                        borderRadius: BorderRadius.circular(AppConstant.radius),
                      ),
                      child: TextButton(
                        onPressed: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (_) => Container(
                              height: 500,
                              color: Theme.of(context).colorScheme.surface,
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
                            showSnackBar(
                              context,
                              title: localization.selectDate,
                            );
                          } else {
                            context.read<TasksBloc>().add(TaskAdded(
                                  TaskParams(
                                    uid: const Uuid().v4(),
                                    taskDateTimeDeadline: dateTime.value,
                                    taskDescription: descriptionController.text,
                                    taskTitle: titleController.text,
                                    taskDone: false,
                                  ),
                                ));
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
