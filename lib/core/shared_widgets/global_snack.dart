import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showSnackbar(BuildContext context,
        {required String title, required Color color}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(title),
        backgroundColor: color,
        duration: const Duration(milliseconds: 600),
      ),
    );
