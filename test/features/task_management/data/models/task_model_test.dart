import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pomodore/features/task_management/data/models/task_model.dart';
import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';

void main() {
  group("Task model", () {
    test("Test task model from json method", () {
      final data =
          File('test/test_resources/random_task.json').readAsStringSync();
      TaskEntity task =
          TaskModel.fromJson(jsonDecode(data) as Map<String, dynamic>);

      expect(task.done, true);
      expect(task.id, "test-uid");
      expect(task.title, "test-title");
      expect(task.description, "test-description");
      expect(task.category, "test-category");
      expect(task.deadLineTime, DateTime.parse("2019-01-01 00:00:00.000"));
      expect(task.doneTime, DateTime.parse("2019-01-01 00:00:00.000"));
    });

    test("Test task model to json method", () {
      final data =
          File('test/test_resources/random_task.json').readAsStringSync();
      TaskEntity task =
          TaskModel.fromJson(jsonDecode(data) as Map<String, dynamic>);

      Map<String, dynamic> json = TaskModel.toJson(task, isCompleted: true);

      expect(json["done"], 1);
      expect(json["uid"], "test-uid");
      expect(json["title"], "test-title");
      expect(json["description"], "test-description");
      expect(json["category"], "test-category");
      expect(json["deadLineTime"], "2019-01-01 00:00:00.000");
      expect(json["doneTime"], "2019-01-01 00:00:00.000");
    });
  });
}
