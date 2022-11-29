import 'package:flutter/material.dart';

import '../constant/constant.dart';

class BaseAppBar extends StatefulWidget with PreferredSizeWidget {
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
  State<BaseAppBar> createState() => _BaseAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(90);
}

class _BaseAppBarState extends State<BaseAppBar> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    _fadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: AppBar(
          leading: Hero(
              tag: AppConstant.splashIconHeroTag,
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                  icon: widget.hasBackBtn
                      ? const Icon(Icons.arrow_back)
                      : Material(
                          color: Colors.transparent,
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            "assets/images/logov2.png",
                          ),
                        ),
                  onPressed:
                      widget.hasBackBtn ? () => Navigator.pop(context) : null,
                ),
              )),
          title: Text(
            widget.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: AppConstant.secondaryColor),
          ),
          actions: [
            IconButton(
              onPressed: widget.onPressed,
              icon: widget.action ?? Container(),
            ),
          ],
        ),
      ),
    );
  }
}
