import 'package:flutter/material.dart';

import '../../../../exports.dart';

class DetailRichTextWidget extends StatelessWidget {
  const DetailRichTextWidget({
    Key? key,
    required this.count,
    required this.title,
  }) : super(key: key);

  final String title, count;

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          TextSpan(
            text: " $count ",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
