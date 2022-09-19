import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/controller/home_controller.dart';
import 'package:getx_todo/view/home_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Obx(
            () => Container(
                child: Column(
              children: [
                //  ? Text('')?
                Text(controller.tasks.isEmpty ? '' : controller.tasks[0]),
                Icon(
                  Icons.home,
                  size: 30,
                ),
              ],
            )),
          ),
        ));
  }
}
