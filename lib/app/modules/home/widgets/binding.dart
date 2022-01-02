// ignore_for_file: unused_import, avoid_web_libraries_in_flutter

//import 'dart:ffi';
import 'dart:html';

import 'package:get/get.dart';
import 'package:todo_list_flutter/app/data/providers/task_provider.dart';
import 'package:todo_list_flutter/app/data/services/storage/repository.dart';
import 'package:todo_list_flutter/app/modules/home/widgets/controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(
          taskRepository: TaskRepository(
            taskProvider: TaskProvider(),
          ),
        ));
  }
}
