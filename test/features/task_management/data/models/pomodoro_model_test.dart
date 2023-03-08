import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pomodore/features/task_management/data/models/pomodoro_model.dart';
import 'package:pomodore/features/task_management/domain/entities/pomodoro_entity.dart';

void main() {
  group("Pomodoro model", () {
    test("Test pomodoro model to json method", () {
      final data =
          File("test/test_resources/random_pomodoro.json").readAsStringSync();
      Map<String, dynamic> json = jsonDecode(data) as Map<String, dynamic>;
      PomodoroEntity pomodoro = PomodoroModel.fromJson(json);

      expect(pomodoro.id, 2);
      expect(pomodoro.duration, 20);
      expect(pomodoro.taskUid, "d0e7c0f0-6f62-11e3-8f96-0800200c9a66");
      expect(pomodoro.dateTime, "2019-01-01");
    });

    test("Test pomodoro model from json method", () {
      final data =
          File("test/test_resources/random_pomodoro.json").readAsStringSync();
      Map<String, dynamic> json = jsonDecode(data) as Map<String, dynamic>;
      PomodoroEntity pomodoro = PomodoroModel.fromJson(json);

      Map<String, dynamic> temp = PomodoroModel.toJson(pomodoro);

      expect(temp["duration"], 20);
      expect(temp["taskUid"], "d0e7c0f0-6f62-11e3-8f96-0800200c9a66");
      expect(temp["dateTime"], "2019-01-01");
    });
  });
}
