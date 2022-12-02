import 'package:flutter_test/flutter_test.dart';
import 'package:pomodore/core/utils/utils.dart';

void main() {
  group("Utils", () {
    test("Test sec to formatted min:sec", () {
      var formatterTime = Utils.formatSecToMinSec(timeInSecond: 90);
      expect(formatterTime, "01 : 30");
    });

    test("Test unique id generator", () {
      var firstId = Utils.createUniqueId();
      var secondId = Utils.createUniqueId();

      expect(firstId != secondId, true);
    });
  });
}
