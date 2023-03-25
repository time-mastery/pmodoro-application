import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";

import "../../../../core/shared_widgets/base_app_bar.dart";
import "../../../../core/shared_widgets/custom_form_field.dart";
import "../../../../core/shared_widgets/global_button.dart";
import "../../../../core/shared_widgets/global_datetime_picker.dart";
import "../../../../core/shared_widgets/global_indicator.dart";
import "../../../../core/shared_widgets/global_snack.dart";
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
    final dateTime = useState<DateTime?>(task.doneTime);

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
                    BlocBuilder<TasksBloc, TasksState>(
                      builder: (context, state) {
                        if (state is AddDateSuccess) {
                          dateTime.value = state.dateTime;
                        }

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
                    GlobalDateTimePicker(
                      buttonTitle: "Select Deadline DateTime",
                      onChanged: (time) {
                        context.read<TasksBloc>().add(DateAdded(time));
                        dateTime.value = time;
                      },
                      onConfirm: (time) {
                        context.read<TasksBloc>().add(DateAdded(time));
                        dateTime.value = time;
                      },
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
                                    TaskEntity(
                                      id: task.id,
                                      title: titleController.text,
                                      description: descriptionController.text,
                                      deadLineTime: dateTime.value!,
                                      doneTime: task.doneTime,
                                      done: false,
                                      category: task.category,
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
