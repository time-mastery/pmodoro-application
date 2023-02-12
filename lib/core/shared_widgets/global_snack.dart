import 'package:flutter/material.dart';
import 'package:pomodore/core/constant/constant.dart';

showSnackBar(BuildContext context, {required String title, Color? color}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(title),
        backgroundColor: color ?? Theme.of(context).primaryColor,
        duration: const Duration(milliseconds: 600),
      ),
    );
