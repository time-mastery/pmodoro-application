import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:ionicons/ionicons.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";

import "../../../../core/utils/responsive/size_config.dart";
import "../../../../exports.dart";
import "../../domain/entities/language_entity.dart";
import "../blocs/settings_bloc/settings_bloc.dart";

class ChangeLanguageBottomSheet extends StatelessWidget {
  const ChangeLanguageBottomSheet({Key? key}) : super(key: key);

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

    final List<LanguageEntity> flags = [
      LanguageEntity("English", "en"),
      LanguageEntity("Persian/Farsi", "fa"),
      LanguageEntity("German", "de"),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Row(
            children: [
              const Icon(Ionicons.language),
              (SizeConfig.widthMultiplier * 2).spaceW(),
              Text(
                localization.changeLanguageTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const Spacer(),
          IconButton(
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
                          localization.changeLanguageTitle,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: flags.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 2),
                              child: Card(
                                child: InkWell(
                                  onTap: () {
                                    context.read<SettingsBloc>().add(
                                          LocaleChanged(
                                              flags[index].languageCode),
                                        );
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      flags[index].title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            fontStyle: FontStyle.italic,
                                          ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ));
            },
            icon: const Icon(Icons.arrow_drop_down_circle),
          ),
        ],
      ),
    );
  }
}
