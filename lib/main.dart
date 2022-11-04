import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pomodore/core/constant/constant.dart';
import 'package:pomodore/core/router/router.dart';

import 'core/utils/size_config.dart';

void main() async {
  runApp(const MyApp());

  doWhenWindowReady(() {
    const initialSize = Size(400, 700);
    appWindow.minSize = initialSize;
    appWindow.maxSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.centerRight;
    appWindow.title = AppConstant.appName;
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) =>
          LayoutBuilder(builder: (context, constraints) {
        SizeConfig().init(constraints, orientation);
        return MaterialApp(
          title: AppConstant.appName,
          onGenerateRoute: AppRouter.onGenerationRouter,
          theme: AppConstant.getTheme(context),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('fa'),
            Locale('de'),
          ],
          locale: const Locale('fa'),
        );
      }),
    );
  }
}
