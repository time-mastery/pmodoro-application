import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';


class GlobalDateTimePicker extends StatelessWidget {
  const GlobalDateTimePicker({
    Key? key,
    required this.buttonTitle,
    this.onChanged,
    this.onConfirm,
  }) : super(key: key);

  final String buttonTitle;
  final DateChangedCallback? onChanged, onConfirm;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          DatePicker.showDateTimePicker(
            context,
            showTitleActions: true,
            theme: const DatePickerTheme(),
            minTime: DateTime.now(),
            maxTime: DateTime(2024, 6, 7),
            onChanged: onChanged,
            onConfirm: onConfirm,
            currentTime: DateTime.now(),
            locale: LocaleType.en,
          );
        },
        child: Text(
          buttonTitle,
        ));
  }
}
