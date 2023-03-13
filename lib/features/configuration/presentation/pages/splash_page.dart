import "dart:math";

import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:pomodore/core/constant/constant.dart";
import "package:pomodore/core/utils/responsive/size_config.dart";

import "base_page.dart";

class SplashPage extends HookWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 3800),
    )..forward();

    controller.addListener(() {
      if (controller.isCompleted) {
        Navigator.pushReplacementNamed(context, BasePage.routeName);
      }
    });

    final animation = Tween(begin: 0.0, end: 10 * pi).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.ease,
    ));

    return Scaffold(
      body: Center(
        child: Hero(
            tag: AppConstant.splashIconHeroTag,
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, child) => Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateY(animation.value),
                child: Image.asset(
                  AppConstant.getLogoPath(context),
                  width: SizeConfig.widthMultiplier * 35,
                  height: SizeConfig.widthMultiplier * 35,
                ),
              ),
            )),
      ),
    );
  }
}
