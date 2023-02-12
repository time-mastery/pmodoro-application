import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodore/core/shared_widgets/base_app_bar.dart';
import 'package:pomodore/core/shared_widgets/custom_form_field.dart';
import 'package:pomodore/core/shared_widgets/global_button.dart';
import 'package:pomodore/core/shared_widgets/global_datetime_picker.dart';
import 'package:pomodore/core/shared_widgets/global_snack.dart';
import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';
import 'package:pomodore/features/task_management/presentation/blocs/tasks_bloc/tasks_bloc.dart';

import '../../../../core/shared_widgets/global_indicator.dart';
import '../../../../core/utils/utils.dart';
import '../../../../di.dart';
import '../../../../exports.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  static const routeName = "/addTask";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            getIt.get<TasksBloc>()..add(CategoriesFetched()),
        child: const AddTaskView());
  }
}

class AddTaskView extends StatefulWidget {
  const AddTaskView({Key? key}) : super(key: key);

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  DateTime? dateTime;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
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
                    const SizedBox(height: 20),
                    GlobalDateTimePicker(
                      buttonTitle: "Select Deadline DateTime",
                      onChanged: (time) {
                        dateTime = time;
                      },
                      onConfirm: (time) {
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
                            context.read<TasksBloc>().add(TaskAdded(TaskEntity(
                                  id: Utils.createUniqueId(),
                                  title: titleController.text,
                                  description: descriptionController.text,
                                  deadLineTime: dateTime!,
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
