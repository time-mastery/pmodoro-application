import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "package:ionicons/ionicons.dart";
import "package:pomodore/core/constant/constant.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";
import "package:pomodore/core/shared_widgets/base_app_bar.dart";
import "package:pomodore/core/shared_widgets/custom_form_field.dart";
import "package:pomodore/core/shared_widgets/global_button.dart";
import "package:pomodore/core/utils/icon_converter.dart";
import "package:pomodore/exports.dart";

class AddHabitPage extends StatelessWidget {
  const AddHabitPage({super.key});

  static const routeName = "/addHabit";

  @override
  Widget build(BuildContext context) {
    return const AddHabitView();
  }
}

class AddHabitView extends HookWidget {
  const AddHabitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedIcon = useState(-1);
    var selectedColor = useState(-1);
    var nameController = useTextEditingController();
    var desctiptionController = useTextEditingController();

    final AppLocalizations localization = AppLocalizations.of(context)!;

    List iconList = IconConverter.icons.values.toList();

    return Scaffold(
      appBar: BaseAppBar(
        title: localization.addHabitTitle,
        hasBackBtn: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppConstant.modalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFormField(
              editController: nameController,
              hint: localization.habitNameHint,
            ),
            CustomFormField(
              editController: desctiptionController,
              hint: localization.habitDescriptionHint,
            ),
            20.spaceH(),
            Text(localization.habitIcon),
            20.spaceH(),
            Center(
              child: Wrap(
                alignment: WrapAlignment.start,
                children: List.generate(
                  iconList.length,
                  (index) => InkWell(
                    onTap: () {
                      selectedIcon.value = index;
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          AppConstant.radius,
                        ),
                        color: selectedIcon.value == index
                            ? Theme.of(context).colorScheme.onBackground
                            : Colors.transparent,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        iconList[index],
                        color: selectedIcon.value == index
                            ? Theme.of(context).colorScheme.background
                            : null,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            20.spaceH(),
            Text(localization.habitColor),
            20.spaceH(),
            Center(
              child: Wrap(
                alignment: WrapAlignment.start,
                children: List.generate(
                  Colors.primaries.length,
                  (index) => InkWell(
                    onTap: () {
                      selectedColor.value = index;
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          AppConstant.radius,
                        ),
                        color: selectedColor.value == index
                            ? Theme.of(context).colorScheme.onBackground
                            : Colors.transparent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.primaries[index],
                            borderRadius: BorderRadius.circular(
                              AppConstant.radius,
                            ),
                          ),
                          width: 25,
                          height: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: GlobalButton(
                title: localization.submitButton,
                onPressed: () {},
              ),
            ),
            10.spaceH(),
          ],
        ),
      ),
    );
  }
}
