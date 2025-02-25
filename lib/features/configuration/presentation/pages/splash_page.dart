import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pomodore/core/constant/constant.dart";
import "package:pomodore/core/utils/responsive/size_config.dart";
import "package:pomodore/features/configuration/presentation/pages/splash_provider.dart";

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      checkForSplashNavigationPathProvider,
      (previous, next) {
        Navigator.pushReplacementNamed(
          context,
          next.requireValue,
        );
      },
    );
    return Scaffold(
      body: Center(
        child: Hero(
          tag: AppConstant.splashIconHeroTag,
          child: Image.asset(
            AppConstant.getLogoPath(context),
            width: SizeConfig.widthMultiplier * 35,
            height: SizeConfig.widthMultiplier * 35,
          ),
        ),
      ),
    );
  }
}
