import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_flutter/app/core/utils/extensions.dart';
import 'package:todo_list_flutter/app/modules/home/widgets/controller.dart';

class ReportPage extends StatelessWidget {
  final homeCrtl = Get.find<HomeController>();
  ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          var createdTasks = homeCrtl.getTotalTask();
          var completedTasks = homeCrtl.getTotalDoneTask();
          var liveTasks = createdTasks - completedTasks;
          var precent =
              (completedTasks / createdTasks * 100).toStringAsFixed(0);
          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(4.0.wp),
                child: Text(
                  'My Report',
                  style: TextStyle(
                    fontSize: 24.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
