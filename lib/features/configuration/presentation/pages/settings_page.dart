import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";
import "package:pomodore/core/shared_widgets/base_app_bar.dart";
import "package:pomodore/core/utils/responsive/size_config.dart";
import "package:pomodore/features/configuration/presentation/blocs/settings_bloc/settings_bloc.dart";

import "../../../../core/resources/params/settings_params.dart";
import "../../../../core/services/database/storage.dart";
import "../../../../di.dart";
import "../../../../exports.dart";
import "../../domain/entities/settings_entity.dart";
import "../widgets/change_language_bottom_sheet.dart";
import "../widgets/change_theme_bottom_sheet.dart";

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<SettingsBloc>()..add(SettingsFromDeviceFetched()),
      child: const SettingsView(),
    );
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;
    SettingsEntity entity = const SettingsEntity(
        notification: false,
        sound: false,
        vibration: false,
        appUpdates: false,
        newTips: false,
        ads: false);

    return Scaffold(
      appBar: BaseAppBar(title: localization.settingsTitle),
      body: SingleChildScrollView(
        child: BlocConsumer(
          bloc: context.read<SettingsBloc>(),
          listener: (BuildContext context, Object? state) {},
          builder: (context, state) {
            if (state is SettingFetchingSuccess) {
              entity = state.item;
            }
            return Column(
              children: [
                (SizeConfig.heightMultiplier * 3).spaceH(),
                const ChangeThemeBottomSheet(),
                (SizeConfig.heightMultiplier * .5).spaceH(),
                SwitchListTile.adaptive(
                  title: Row(
                    children: [
                      const Icon(Icons.notifications_off),
                      10.spaceW(),
                      Text(localization.generalNotificationTitle),
                    ],
                  ),
                  value: entity.notification,
                  onChanged: (value) {
                    context
                        .read<SettingsBloc>()
                        .add(SettingsChanged(ChangeSettingsParams(
                          key: FStorage.notificationKey,
                          value: value,
                        )));
                  },
                ),
                (SizeConfig.heightMultiplier * .5).spaceH(),
                SwitchListTile.adaptive(
                  title: Row(
                    children: [
                      const Icon(Icons.keyboard_voice),
                      10.spaceW(),
                      Text(localization.soundTitle),
                    ],
                  ),
                  value: entity.sound,
                  onChanged: (value) {
                    context.read<SettingsBloc>().add(
                          SettingsChanged(
                            ChangeSettingsParams(
                              key: FStorage.soundKey,
                              value: value,
                            ),
                          ),
                        );
                  },
                ),
                (SizeConfig.heightMultiplier * .5).spaceH(),
                const ChangeLanguageBottomSheet(),
              ],
            );
          },
        ),
      ),
    );
  }
}
