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
        title: "Add New Task",
        hasBackBtn: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const CustomFormField(hint: "Task Title"),
            const SizedBox(height: 20),
            const CustomFormField(
              hint: "Date",
            ),
            const SizedBox(height: 20),
            const CustomFormField(hint: "Category"),
            const Expanded(child: SizedBox(height: 1)),
            MyButton(
              onPressed: () {},
              title: "Submit Task",
              backgroundColor: AppConstant.cyanColor,
            ),
          ],
        ),
      ),
    );
  }
}
