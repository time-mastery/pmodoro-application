import 'package:flutter/material.dart';
import 'package:pomodore/core/constant/constant.dart';
import 'package:pomodore/core/utils/size_config.dart';

import 'base_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
        (value) => Navigator.pushReplacementNamed(context, BasePage.routeName));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
            tag: AppConstant.splashIconHeroTag,
            child: Material(
              color: Colors.transparent,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(
                "assets/images/logov2.png",
                width: SizeConfig.widthMultiplier * 35,
                height: SizeConfig.widthMultiplier * 35,
              ),
            )),
      ),
    );
  }
}
