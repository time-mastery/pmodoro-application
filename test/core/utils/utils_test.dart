import "package:flutter_test/flutter_test.dart";
import "package:pomodore/core/utils/utils.dart";

void main() {
  group("Utils", () {
    test("Test month name function", () {
      final monthName = Utils.monthNameOfDateTime(DateTime(1998, 4, 1));
      expect(monthName, "April");
    });

    test("Test create overview function", () {
      final overviewDate =
          Utils.createOverviewItemDateTime(DateTime(1998, 4, 1));
      expect(overviewDate, DateTime(1998, 4, 1));
    });

    test("Test sec to formatted min:sec", () {
      final formatterTime = Utils.formatSecToMinSec(timeInSecond: 90);
      expect(formatterTime, "01\n30");
    });

    test("Test unique id generator", () {
      final firstId = Utils.createUniqueId();
      final secondId = Utils.createUniqueId();

      expect(firstId != secondId, true);
    });

    test("Test check date is today method", () {
      final bool today = Utils.checkDateIsToday(DateTime.now());

      expect(today, true);
    });

    test("Test pomodoro timer calculator", () {
      final int time = Utils.calculatePomodoroTime(120, 20);

      expect(time, 100);
    });

    test("Test time to formatted yyyy MM dd", () {
      final dateTime = DateTime(1998, 1, 1);
      final result =
          Utils.formatDateToYYYYMMDD(dateTime.add(const Duration(days: 1)));

      expect(result, "1998-01-02");
    });
  });
}
