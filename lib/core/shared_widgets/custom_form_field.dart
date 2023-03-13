import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_hooks/flutter_hooks.dart";

import "../../exports.dart";

class CustomFormField extends HookWidget {
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
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;
    final obscure = useState<bool>(true);

    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofocus: false,
      controller: editController,
      obscureText: obscure.value && isPasswordField,
      maxLength: maxLength,
      decoration: InputDecoration(
        suffixIcon: isPasswordField
            ? GestureDetector(
                onTap: () {
                  obscure.value = !obscure.value;
                },
                child: Icon(
                  obscure.value ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
        label: Text(
          hint ?? "",
          textAlign: TextAlign.left,
        ),
      ),
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      inputFormatters: (formatter != null)
          ? formatter
          : (justNumber == true)
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
                ]
              : (isRating == true)
                  ? <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r"[1-5]")),
                    ]
                  : null,
      validator: (value) {
        if (validatorsType == "email") {
          return null;
        } else if (validatorsType == "length") {
          if (value!.length < 2) {
            return localization.minCharValidationTitle;
          } else {
            return null;
          }
        }
        return null;
      },
      keyboardType: textInputType,
    );
  }
}
