import 'package:flutter/material.dart';
import 'package:pomodore/core/widgets/base_app_bar.dart';
import 'package:pomodore/core/widgets/custom_form_field.dart';
import 'package:pomodore/core/widgets/my_button.dart';

import '../../../../core/constant/constant.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  static const routeName = "/addTask";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: AppConstant.addNewTaskTitle,
        hasBackBtn: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const CustomFormField(hint: AppConstant.taskTitle),
            const SizedBox(height: 20),
            const CustomFormField(
              hint: AppConstant.dateTitle,
            ),
            const SizedBox(height: 20),
            const CustomFormField(hint: AppConstant.categoryTitle),
            const Expanded(child: SizedBox(height: 1)),
            MyButton(
              onPressed: () {},
              title: AppConstant.submitTask,
              backgroundColor: AppConstant.cyanColor,
            ),
          ],
        ),
      ),
    );
  }
}
