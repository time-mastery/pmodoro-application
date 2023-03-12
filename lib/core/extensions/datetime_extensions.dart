import "package:intl/intl.dart";

extension FancyDateTime on DateTime {
  String taskTimeFormat() => DateFormat("kk:mm").format(this);

  String taskDateFormat() => DateFormat("yyyy-MM-dd").format(this);
}
