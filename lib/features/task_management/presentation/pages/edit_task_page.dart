import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_widgets/base_app_bar.dart';
import '../../../../core/shared_widgets/custom_form_field.dart';
import '../../../../core/shared_widgets/global_button.dart';
import '../../../../core/shared_widgets/global_datetime_picker.dart';
import '../../../../core/shared_widgets/global_indicator.dart';
import '../../../../core/shared_widgets/global_snack.dart';
import '../../../../di.dart';
import '../../../../exports.dart';
import '../../domain/entities/task_entity.dart';
import '../blocs/tasks_bloc/tasks_bloc.dart';

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

class EditTaskView extends StatefulWidget {
  const EditTaskView({Key? key, required this.task}) : super(key: key);

  final TaskEntity task;

  @override
  State<EditTaskView> createState() => _EditTaskViewState();
}

class _EditTaskViewState extends State<EditTaskView> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  DateTime? dateTime;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    titleController = TextEditingController(text: widget.task.title);
    descriptionController =
        TextEditingController(text: widget.task.description);
    dateTime = widget.task.deadLineTime;
    super.initState();
  }

  @override
  void dispose() {
    controllersDisposer();
    super.dispose();
  }

  void controllersDisposer() {
    titleController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;

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
            key: _formKey,
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
                    const SizedBox(height: 20),
                    CustomFormField(
                      validatorsType: "length",
                      editController: descriptionController,
                      hint: localization.taskDescription,
                    ),
                    const SizedBox(height: 20),
                    BlocBuilder<TasksBloc, TasksState>(
                      builder: (context, state) {
                        if (state is AddDateSuccess) dateTime = state.dateTime;

                        if (dateTime != null) {
                          return Row(
                            children: [
                              Text(
                                "${localization.dateTitle} : ",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(dateTime.toString()),
                            ],
                          );
                        }
                        return Container();
                      },
                    ),
                    const SizedBox(height: 20),
                    GlobalDateTimePicker(
                      buttonTitle: "Select Deadline DateTime",
                      onChanged: (time) {
                        context.read<TasksBloc>().add(DateAdded(time));
                        dateTime = time;
                      },
                      onConfirm: (time) {
                        context.read<TasksBloc>().add(DateAdded(time));
                        dateTime = time;
                      },
                    ),
                    const SizedBox(height: 20),
                    GlobalButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (dateTime == null) {
                            showSnackBar(context,
                                title: "Please select a datetime");
                          } else {
                            context.read<TasksBloc>().add(
                                  TaskEdited(
                                    TaskEntity(
                                      id: widget.task.id,
                                      title: titleController.text,
                                      description: descriptionController.text,
                                      deadLineTime: dateTime!,
                                      doneTime: widget.task.doneTime,
                                      done: false,
                                      category: widget.task.category,
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
