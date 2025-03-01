import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";
import "package:pomodore/core/shared_widgets/base_app_bar.dart";
import "package:pomodore/core/shared_widgets/custom_form_field.dart";
import "package:pomodore/core/shared_widgets/global_button.dart";
import "package:pomodore/core/shared_widgets/global_snack.dart";
import "package:pomodore/features/task_management/models/task_model.dart";
import "package:pomodore/features/task_management/providers/task_management_providers.dart";
import "package:uuid/uuid.dart";
import "../../../core/constant/constant.dart";
import "../../../core/resources/params/task_params.dart";
import "../../../core/shared_widgets/global_indicator.dart";
import "../../../core/utils/responsive/size_config.dart";
import "../../../exports.dart";

class AddTaskPage extends ConsumerStatefulWidget {
  const AddTaskPage({super.key, this.editItem});

  static const routeName = "/addTask";

  final TaskModel? editItem;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends ConsumerState<AddTaskPage> {
  DateTime? dateTime;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;

    final asyncAddTask = ref.watch(addTaskProvider);

    ref.listen(
      addTaskProvider,
      (previous, next) {
        next.when(
          data: (data) {
            if (mounted && data) {
              Navigator.pop(context);
            }
          },
          error: (error, stackTrace) {
            showSnackBar(
              context,
              title: localization.failureTitle,
            );
          },
          loading: () {},
        );
      },
    );

    return Scaffold(
      appBar: BaseAppBar(
        title: localization.addNewTaskTitle,
        hasBackBtn: true,
      ),
      body: Form(
        key: formKey,
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
                if (dateTime != null)
                  Row(
                    children: [
                      Text(
                        "${localization.dateTitle} : ",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(dateTime.toString()),
                    ],
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
                                      setState(() {
                                        dateTime = val;
                                      });
                                    }),
                              ),

                              // Close the modal
                              CupertinoButton(
                                child: const Text("OK"),
                                onPressed: () {
                                  if (dateTime == null) {
                                    setState(() {
                                      dateTime = DateTime.now();
                                    });
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
                    if (formKey.currentState!.validate()) {
                      if (dateTime == null) {
                        showSnackBar(
                          context,
                          title: localization.selectDate,
                        );
                      } else {
                        ref.read(addTaskProvider.notifier).addTask(
                              TaskParams(
                                uid: const Uuid().v4(),
                                taskDateTimeDeadline: dateTime,
                                taskDescription: descriptionController.text,
                                taskTitle: titleController.text,
                                taskDone: false,
                              ),
                            );
                      }
                    }
                  },
                  child: asyncAddTask.isLoading
                      ? const GlobalIndicator()
                      : Text(localization.submitTask),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
