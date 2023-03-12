import "package:flutter/material.dart";

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(BuildContext context, {required String title, Color? color}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(title),
        backgroundColor: color,
        duration: const Duration(milliseconds: 600),
      ),
    );
