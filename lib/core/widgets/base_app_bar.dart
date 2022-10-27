import 'package:flutter/material.dart';

import '../constant/constant.dart';

class BaseAppBar extends StatelessWidget with PreferredSizeWidget {
  const BaseAppBar({Key? key, required this.title, this.action, this.onPressed})
      : super(key: key);

  final String title;
  final Widget? action;
  final VoidCallback? onPressed;

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
      child: AppBar(
        leading: const Hero(
            tag: AppConstant.splashIconHeroTag,
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
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: AppConstant.cyanColor),
        ),
        actions: [
          IconButton(
            onPressed: () => onPressed,
            icon: action ?? Container(),
          ),
        ],
      ),
    );
  }
}
