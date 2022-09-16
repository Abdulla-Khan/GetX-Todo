import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/controller/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black.withOpacity(0.1),
          elevation: 0,
          shadowColor: Colors.transparent,
          title: const Text(
            'GetX Todo App',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
                wordSpacing: 2,
                fontSize: 26),
          ),
        ),
        body: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) => Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        controller: controller.taskController,
                        decoration: InputDecoration(
                            label: Text(
                              'Add task',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.4)),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(5)),
                          child: TextButton(
                            onPressed: () {
                              controller.taskController.text.isNotEmpty
                                  ? controller.add()
                                  : null;
                            },
                            child: const Text(
                              'Add Task',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Text(
                        'Your Tasks',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black.withOpacity(0.4)),
                      ),
                    ),
                    ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.tasks.length,
                        itemBuilder: (ctx, int index) {
                          return ListTile(
                            leading: Text('${index + 1}'),
                            title: Text(controller.tasks[index]),
                            trailing: SizedBox(
                              width: 200,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        controller.delete(index);
                                      },
                                      icon: const Icon(Icons.delete)),
                                  IconButton(
                                      onPressed: () {
                                        Get.defaultDialog(
                                            title: 'Update Task',
                                            content: Column(
                                              children: [
                                                TextField(
                                                  controller: controller
                                                      .updateController,
                                                  decoration: InputDecoration(
                                                      label: Text(
                                                        'Update task',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.4)),
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20))),
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    ElevatedButton(
                                                        onPressed: () async {
                                                          controller
                                                                  .updateController
                                                                  .text
                                                                  .isNotEmpty
                                                              ? controller
                                                                  .updateTask(
                                                                      index,
                                                                      controller
                                                                          .updateController
                                                                          .text)
                                                              : null;
                                                        },
                                                        child: const Text(
                                                            'Update'))
                                                  ],
                                                )
                                              ],
                                            ));
                                        // Get.dialog();
                                      },
                                      icon: const Icon(Icons.update)),
                                ],
                              ),
                            ),
                          );
                        })
                  ],
                )));
  }
}
