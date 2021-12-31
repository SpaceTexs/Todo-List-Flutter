// ignore_for_file: dead_code, unused_element

import 'dart:convert';

import 'package:get/get.dart';
import 'package:todo_list_flutter/app/core/utils/keys.dart';
import 'package:todo_list_flutter/app/data/models/task.dart';
import 'package:todo_list_flutter/app/data/services/services.dart';

class TaskProvider {
  final _storage = Get.find<StorageService>();

  List<Task> readTasks() {
    var tasks = <Task>[];
    jsonDecode(
      _storage.read(taskKey).toString(),
    ).forEach(
      (e) => tasks.add(Task.fromJson(e)),
    );
    return tasks;
  }

  ///Converte o [object] em uma string JSON.
  void writeTasks(List<Task> tasks) {
    _storage.write(
      taskKey,
      jsonEncode(tasks),
    );
  }
}
