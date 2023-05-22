import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "package:ionicons/ionicons.dart";
import "package:pomodore/core/constant/constant.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";
import "package:pomodore/core/shared_widgets/base_app_bar.dart";
import "package:pomodore/core/shared_widgets/custom_form_field.dart";
import "package:pomodore/core/shared_widgets/global_button.dart";

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

    List iconList = [
      Ionicons.musical_notes_outline,
      Ionicons.film_outline,
      Ionicons.leaf_outline,
      Ionicons.headset_outline,
      Ionicons.shirt_outline,
      Ionicons.today_outline,
      Ionicons.moon_outline,
      Ionicons.telescope_outline,
      Ionicons.bed_outline,
      Ionicons.home_outline,
      Ionicons.car_sport_outline,
      Ionicons.list_outline,
      Ionicons.document_lock_outline,
      Ionicons.open_outline,
      Ionicons.book_outline,
      Ionicons.school_outline,
      Ionicons.library_outline,
      Ionicons.walk_outline,
      Ionicons.wallet_outline,
      Ionicons.game_controller_outline,
      Ionicons.terminal_outline,
      Ionicons.code_download_outline,
      Ionicons.alarm_outline,
      Ionicons.notifications_circle_outline,
    ];
    return Scaffold(
      appBar: const BaseAppBar(
        title: "Add Habit",
        hasBackBtn: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppConstant.modalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFormField(
              editController: nameController,
              hint: "Name",
            ),
            CustomFormField(
              editController: desctiptionController,
              hint: "Description",
            ),
            20.spaceH(),
            const Text("Icon"),
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
            const Text("Color"),
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
                title: "Submit",
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
