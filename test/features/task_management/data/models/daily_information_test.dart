import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pomodore/features/task_management/data/models/daily_information_model.dart';
import 'package:pomodore/features/task_management/domain/entities/daily_information_entity.dart';

void main() {
  group("Daily Information Test", () {
    test("Test daily information model to json method", () {
      var file = File("test/test_resources/random_daily_information.json")
          .readAsStringSync();

      Map<String, dynamic> json = Map<String, dynamic>.from(jsonDecode(file));
      DailyInformationEntity dailyInformationEntity =
          DailyInformationModel.fromJson(json);

      expect(dailyInformationEntity.taskQuantity, 1);
      expect(dailyInformationEntity.completedTaskQuantity, 1);
      expect(dailyInformationEntity.dailyGoalQuantity, 1);
      expect(dailyInformationEntity.processPercentage, 100);
    });
    test("Test daily information model from json method", () {
      var file = File("test/test_resources/random_daily_information.json")
          .readAsStringSync();
      Map<String, dynamic> json = Map<String, dynamic>.from(jsonDecode(file));
      DailyInformationEntity dailyInformationEntity =
          DailyInformationModel.fromJson(json);

      Map<String, dynamic> raw =
          DailyInformationModel.toJson(dailyInformationEntity);

      expect(raw["taskQuantity"], 1);
      expect(raw["completedTaskQuantity"], 1);
      expect(raw["dailyGoalQuantity"], 1);
      expect(raw["processPercentage"], 100.0);
    });
  });
}
