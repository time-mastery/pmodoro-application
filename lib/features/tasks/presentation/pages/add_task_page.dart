import 'package:flutter/material.dart';
import 'package:pomodore/core/widgets/base_app_bar.dart';
import 'package:pomodore/core/widgets/custom_form_field.dart';
import 'package:pomodore/core/widgets/my_button.dart';

import '../../../../core/constant/constant.dart';
import '../../../../exports.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  static const routeName = "/addTask";

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: BaseAppBar(
        title: localization.addNewTaskTitle,
        hasBackBtn: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomFormField(hint: localization.taskTitle),
            const SizedBox(height: 20),
            CustomFormField(
              hint: localization.dateTitle,
            ),
            const SizedBox(height: 20),
            CustomFormField(hint: localization.categoryTitle),
            const Expanded(child: SizedBox(height: 1)),
            MyButton(
              onPressed: () {},
              title: localization.submitTask,
              backgroundColor: AppConstant.secondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
