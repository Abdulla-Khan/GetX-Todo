// import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    loadTask();
  }

  // List task  = [].obs;
  List tasks = [].obs;
  TextEditingController taskController = TextEditingController();
  TextEditingController updateController = TextEditingController();

  void loadTask() async {
    final prefs = await SharedPreferences.getInstance();
    tasks = (prefs.getStringList('tasks') ?? []).obs;
    print(tasks);
  }

  void add() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tasks.add(taskController.text);
    taskController.clear();
    await prefs.setStringList('tasks', tasks.cast()).obs;
    tasks = (prefs.getStringList('tasks') ?? []).obs;
  }

  void delete(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    tasks.removeAt(index);
    prefs.setStringList('tasks', tasks.cast()).obs;
  }

  void updateTask(int index, String element) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    tasks[index] = element;
    prefs.setStringList('tasks', tasks.cast()).obs;

    updateController.clear();
    Get.back();
  }

  void updateDialog(int index) {
    Get.defaultDialog(
        title: 'Update Task',
        content: Column(
          children: [
            TextField(
              controller: updateController,
              decoration: InputDecoration(
                  label: Text(
                    'Update task',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.4)),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      updateController.text.isNotEmpty
                          ? updateTask(index, updateController.text)
                          : null;
                    },
                    child: const Text('Update'))
              ],
            )
          ],
        ));
  }
}
