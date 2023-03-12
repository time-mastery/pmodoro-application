import "package:flutter/cupertino.dart";

import "../../exports.dart";

String? nullValidator(BuildContext context, String? value) =>
    (value == null || value.isEmpty)
        ? AppLocalizations.of(context)!.nullValueValidatorMessage
        : null;
