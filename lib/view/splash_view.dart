import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/controller/home_controller.dart';
import 'package:getx_todo/controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  HomeController controller = Get.put(HomeController());
  SplashController splashController = Get.put(SplashController());

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Obx(
            () => Column(
              children: [
                Text(controller.tasks.isEmpty ? '' : controller.tasks[0]),
                const Icon(
                  Icons.home,
                  size: 30,
                ),
              ],
            ),
          ),
        ));
  }
}
