import 'package:get/get.dart';

import '../controller/home_controller.dart'; 

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}