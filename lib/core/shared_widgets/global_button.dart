import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    Key? key,
    this.child,
    required this.onPressed,
    this.width,
    this.height,
    this.elevation,
    this.padding,
    this.shape,
    this.backgroundColor,
    this.title,
    this.titleStyle,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Widget? child;
  final String? title;
  final double? width, height, elevation;
  final EdgeInsets? padding;
  final OutlinedBorder? shape;
  final Color? backgroundColor;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final ButtonStyle btnStyle = ElevatedButton.styleFrom(
      minimumSize: Size(width ?? size.width * .8, height ?? 50),
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 10),
      shape: shape ??
          const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
      elevation: elevation ?? 5,
      backgroundColor: backgroundColor,
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: btnStyle,
      child: child ??
          Text(
            title ?? "Press me",
            style: titleStyle,
          ),
    );
  }
}
