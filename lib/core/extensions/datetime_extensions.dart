import "package:intl/intl.dart";

extension FancyDateTime on DateTime {
  String taskTimeFormat() => DateFormat("HH:mm a").format(this);

  String taskDateFormat() => DateFormat("yyyy-MM-dd").format(this);
}
