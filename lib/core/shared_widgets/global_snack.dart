import 'package:flutter/material.dart';

showSnackBar(BuildContext context, {required String title, Color? color}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(title),
        backgroundColor: color ?? Theme.of(context).primaryColor,
        duration: const Duration(milliseconds: 600),
      ),
    );
