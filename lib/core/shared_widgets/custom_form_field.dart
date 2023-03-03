import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../exports.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    Key? key,
    this.editController,
    this.textInputType,
    this.onChanged,
    this.validatorsType,
    this.hint,
    this.justNumber,
    this.isRating,
    this.maxLength,
    this.isPasswordField = false,
    this.formatter,
  }) : super(key: key);

  final TextEditingController? editController;
  final TextInputType? textInputType;
  final ValueChanged<String>? onChanged;
  final String? validatorsType, hint;
  final bool? justNumber, isRating;
  final int? maxLength;
  final bool isPasswordField;
  final List<TextInputFormatter>? formatter;

  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;

    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofocus: false,
      controller: widget.editController,
      obscureText: obscure && widget.isPasswordField,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        suffixIcon: widget.isPasswordField
            ? GestureDetector(
                onTap: () {
                  obscure = !obscure;
                  setState(() {});
                },
                child: Icon(
                  obscure ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
        label: Text(
          widget.hint ?? "",
          textAlign: TextAlign.left,
        ),
      ),
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      inputFormatters: (widget.formatter != null)
          ? widget.formatter
          : (widget.justNumber == true)
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ]
              : (widget.isRating == true)
                  ? <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[1-5]')),
                    ]
                  : null,
      validator: (value) {
        if (widget.validatorsType == "email") {
          return null;
        } else if (widget.validatorsType == "length") {
          if (value!.length < 2) {
            return localization.minCharValidationTitle;
          } else {
            return null;
          }
        }
        return null;
      },
      keyboardType: widget.textInputType,
    );
  }
}
