import 'package:flutter/material.dart';

import '../../../../core/constant/constant.dart';
import '../../../../exports.dart';

class DetailRichTextWidget extends StatelessWidget {
  const DetailRichTextWidget({
    Key? key,
    required this.changes,
    required this.count,
    required this.title,
  }) : super(key: key);

  final String title, count, changes;

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
                  color: AppConstant.swatchColor,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
          ),
          TextSpan(
            text: localization.fromYesterdayTitle.replaceAll("x", changes),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppConstant.textColor.withOpacity(.2),
                  fontStyle: FontStyle.italic,
                ),
          ),
        ],
      ),
    );
  }
}
