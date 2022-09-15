import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List tasks = [].obs;
  TextEditingController taskController = TextEditingController();
  TextEditingController updateController = TextEditingController();

  void add() async {
    tasks.add(taskController.text);
    taskController.clear();
  }

  void delete(int index) {
    tasks.removeAt(index);
  }

  void updateTask(int index, String element) {
    tasks[index] = element;
    updateController.clear();
    Get.back();
  }
}
