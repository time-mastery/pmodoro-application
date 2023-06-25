import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";
import "package:pomodore/core/shared_widgets/base_app_bar.dart";
import "package:pomodore/features/task_management/presentation/blocs/tasks_bloc/tasks_bloc.dart";

import "../../../../core/shared_widgets/custom_form_field.dart";
import "../../../../core/shared_widgets/global_button.dart";
import "../../../../core/shared_widgets/global_indicator.dart";
import "../../../../core/shared_widgets/global_snack.dart";
import "../../../../di.dart";
import "../../../../exports.dart";

class AddCategoryPage extends StatelessWidget {
  const AddCategoryPage({Key? key}) : super(key: key);

  static const routeName = "/addCategory";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<TasksBloc>(),
      child: const AddCategoryView(),
    );
  }
}

class AddCategoryView extends HookWidget {
  const AddCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;
    final titleController = useTextEditingController();
    final formKey = useState(GlobalKey<FormState>());

    return BlocConsumer<TasksBloc, TasksState>(
      listener: (context, state) {
        if (state is CategoryAddSuccess || state is CategoryAddFailure) {
          showSnackBar(context,
              title: (state is CategoryAddSuccess)
                  ? localization.successTitle
                  : localization.failureTitle,
              color: Theme.of(context).primaryColor);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey.value,
          child: Scaffold(
            appBar: BaseAppBar(
              title: localization.addCategoryTitle,
              hasBackBtn: true,
            ),
            body: SingleChildScrollView(
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
                    GlobalButton(
                      onPressed: () {
                        if (formKey.value.currentState!.validate()) {}
                      },
                      backgroundColor: Theme.of(context).secondaryHeaderColor,
                      child: (state is CategoryAddLoading)
                          ? const GlobalIndicator()
                          : Text(localization.submitCategory),
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
