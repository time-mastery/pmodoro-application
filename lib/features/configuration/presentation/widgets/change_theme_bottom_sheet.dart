import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";

import "../../../../core/constant/constant.dart";
import "../../../../core/utils/responsive/size_config.dart";
import "../../../../exports.dart";
import "../blocs/settings_bloc/settings_bloc.dart";

class ChangeThemeBottomSheet extends StatelessWidget {
  const ChangeThemeBottomSheet({Key? key}) : super(key: key);

  Future<void> bottomSheet(BuildContext context, Widget? child) =>
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: SizeConfig.heightMultiplier * 90,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
              ),
              child: child ?? Container());
        },
      );

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Row(
            children: [
              const Icon(Icons.color_lens),
              (SizeConfig.widthMultiplier * 2).spaceW(),
              Text(
                localization.changeThemeTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.arrow_drop_down_circle),
            onPressed: () {
              bottomSheet(
                  context,
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 10,
                        ),
                        child: Text(
                          localization.changeThemeTitle,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Expanded(
                          child: ListView.builder(
                        itemCount: AppConstant.themes.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 2),
                          child: Card(
                            child: InkWell(
                              onTap: () {
                                context.read<SettingsBloc>().add(
                                    ThemeChanged(AppConstant.themes[index]));
                                Navigator.pop(context);
                              },
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(
                                    AppConstant.themes[index].title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                    ],
                  ));
            },
          ),
        ],
      ),
    );
  }
}
