import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodore/core/shared_widgets/base_app_bar.dart';
import 'package:pomodore/features/task_management/domain/entities/category_entity.dart';
import 'package:pomodore/features/task_management/presentation/blocs/tasks_bloc/tasks_bloc.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/shared_widgets/custom_form_field.dart';
import '../../../../core/shared_widgets/global_button.dart';
import '../../../../core/shared_widgets/global_indicator.dart';
import '../../../../core/shared_widgets/global_snack.dart';
import '../../../../di.dart';
import '../../../../exports.dart';

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

class AddCategoryView extends StatefulWidget {
  const AddCategoryView({Key? key}) : super(key: key);

  @override
  State<AddCategoryView> createState() => _AddCategoryViewState();
}

class _AddCategoryViewState extends State<AddCategoryView> {
  late TextEditingController titleController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    titleController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controllersDisposer();
    super.dispose();
  }

  void controllersDisposer() {
    titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;

    return BlocConsumer<TasksBloc, TasksState>(
      listener: (context, state) {
        if (state is CategoryAddSuccess || state is CategoryAddFail) {
          showSnackBar(context,
              title: (state is CategoryAddSuccess)
                  ? localization.successTitle
                  : localization.failureTitle,
              color: AppConstant.primaryColor);
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
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
                    const SizedBox(height: 20),
                    GlobalButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<TasksBloc>().add(CategoryAdded(
                              CategoryEntity(title: titleController.text)));
                        }
                      },
                      backgroundColor: AppConstant.secondaryColor,
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
