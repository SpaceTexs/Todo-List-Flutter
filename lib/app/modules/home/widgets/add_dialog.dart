import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_flutter/app/core/utils/extensions.dart';
import 'package:todo_list_flutter/app/modules/home/widgets/controller.dart';

class AddDialog extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();

  AddDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: homeCtrl.formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.close),
                  ),
                  TextButton(
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent)),
                    onPressed: () {},
                    child: Text(
                      'Done',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'New Task',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                controller: homeCtrl.editCtrl,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                ),
                autofocus: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your todo item';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                top: 10.0,
                right: 8.0,
                bottom: 8.0,
              ),
              child: Text(
                'Add to',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
            ),
            ...homeCtrl.tasks
                .map(
                  (element) => Obx(
                    () => InkWell(
                      onTap: () => homeCtrl.changeTask(element),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 8.0,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              IconData(element.icon,
                                  fontFamily: 'MaterialIcons'),
                              color: HexColor.fromHex(element.color),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              element.title,
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (homeCtrl.task.value == element)
                              Icon(
                                Icons.check,
                                color: Colors.blue,
                              )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
