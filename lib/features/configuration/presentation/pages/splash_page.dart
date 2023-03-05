import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pomodore/core/constant/constant.dart';
import 'package:pomodore/core/utils/responsive/size_config.dart';

import 'base_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3800),
    )
      ..forward()
      ..addListener(() {
        if (_animationController.isCompleted) {
          Navigator.pushReplacementNamed(context, BasePage.routeName);
        }
      });

    _animation = Tween<double>(begin: 0, end: 10 * pi).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.ease,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
            tag: AppConstant.splashIconHeroTag,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) => Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateY(_animation.value),
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
