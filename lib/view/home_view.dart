import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/controller/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
        body: SingleChildScrollView(
          child: GetBuilder<HomeController>(
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
                      Obx(() {
                        return controller.tasks.isEmpty
                            ? Container(
                                padding: EdgeInsets.only(top: s.height / 3.5),
                                child: const Text('NO'))
                            : ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.tasks.length,
                                itemBuilder: (ctx, int index) {
                                  return ListTile(
                                    leading: Text('${index + 1}'),
                                    title: GestureDetector(
                                        onTap: () {
                                          controller.completed(index);
                                        },
                                        child: Text(controller.tasks[index])),
                                    trailing: SizedBox(
                                      width: 100,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                controller.delete(index);
                                              },
                                              icon: const Icon(Icons.delete)),
                                          IconButton(
                                              onPressed: () {
                                                controller.updateDialog(index);
                                              },
                                              icon: const Icon(Icons.update)),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                      })
                    ],
                  )),
        ));
  }
}
