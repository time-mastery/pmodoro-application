import 'package:flutter_test/flutter_test.dart';
import 'package:pomodore/core/utils/datetime_converter.dart';

void main() {
  group("Timer Converters", () {
    test("Test sec to formatted min:sec", () {
      var formatterTime = DateTimeConverter.formatSecToMinSec(timeInSecond: 90);
      expect(formatterTime, "01 : 30");
    });
  });
}
