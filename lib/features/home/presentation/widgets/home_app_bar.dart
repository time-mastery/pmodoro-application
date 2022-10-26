import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../core/constant/constant.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
      child: AppBar(
        leading: const Hero(
            tag: "__splash-home__",
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                icon: FlutterLogo(
                  size: 30,
                  curve: Curves.bounceIn,
                ),
                onPressed: null,
              ),
            )),
        title: Text(
          "Pomodore Timer",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: AppConstant.orangeColor),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Ionicons.stats_chart,
                color: AppConstant.orangeColor,
              ))
        ],
      ),
    );
  }
}
