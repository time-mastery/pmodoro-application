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

import "../../../../core/shared_widgets/global_indicator.dart";
import "../../../../core/utils/utils.dart";
import "../../../../di.dart";
import "../../../../exports.dart";

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({Key? key, this.editItem}) : super(key: key);

  static const routeName = "/addTask";

  final TaskEntity? editItem;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            getIt.get<TasksBloc>()..add(CategoriesFetched()),
        child: const AddTaskView());
  }
}

class AddTaskView extends HookWidget {
  const AddTaskView({Key? key}) : super(key: key);

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
                    // todo : date picker
                    // GlobalDateTimePicker(
                    //   buttonTitle: localization.selectDate,
                    //   onChanged: (time) {
                    //     context.read<TasksBloc>().add(DateAdded(time));
                    //     dateTime.value = time;
                    //   },
                    //   onConfirm: (time) {
                    //     context.read<TasksBloc>().add(DateAdded(time));
                    //     dateTime.value = time;
                    //   },
                    // ),
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
                            context.read<TasksBloc>().add(TaskAdded(TaskEntity(
                                  id: Utils.createUniqueId(),
                                  title: titleController.text,
                                  description: descriptionController.text,
                                  deadLineTime: dateTime.value!,
                                  doneTime: DateTime.now(),
                                  done: false,
                                  category: "cate",
                                )));
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
