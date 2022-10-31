import 'package:flutter/material.dart';

import '../constant/constant.dart';

class BaseAppBar extends StatelessWidget with PreferredSizeWidget {
  const BaseAppBar(
      {Key? key,
      required this.title,
      this.action,
      this.onPressed,
      this.hasBackBtn = false})
      : super(key: key);

  final String title;
  final Widget? action;
  final VoidCallback? onPressed;
  final bool hasBackBtn;

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
      child: AppBar(
        leading: Hero(
            tag: AppConstant.splashIconHeroTag,
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                icon: hasBackBtn
                    ? const Icon(Icons.arrow_back)
                    : Material(
                        color: Colors.transparent,
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          "assets/images/logo.png",
                        ),
                      ),
                onPressed: hasBackBtn ? () => Navigator.pop(context) : null,
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
            onPressed: onPressed,
            icon: action ?? Container(),
          ),
        ],
      ),
    );
  }
}
