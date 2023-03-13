import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "../constant/constant.dart";

class BaseAppBar extends HookWidget with PreferredSizeWidget {
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
    final controller = useAnimationController(
        duration: const Duration(milliseconds: 800),
        lowerBound: 0.0,
        upperBound: 1.0)
      ..forward();

    return Directionality(
      textDirection: TextDirection.ltr,
      child: FadeTransition(
        opacity: controller,
        child: Container(
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
                              AppConstant.getLogoPath(context),
                            ),
                          ),
                    onPressed: hasBackBtn ? () => Navigator.pop(context) : null,
                  ),
                )),
            title: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: [
              IconButton(
                onPressed: onPressed,
                icon: action ?? Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
