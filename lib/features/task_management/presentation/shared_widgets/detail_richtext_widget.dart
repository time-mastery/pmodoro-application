import "package:flutter/material.dart";

class DetailRichTextWidget extends StatelessWidget {
  const DetailRichTextWidget({
    super.key,
    required this.count,
    required this.title,
  });

  final String title, count;

  @override
  Widget build(BuildContext context) {
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
