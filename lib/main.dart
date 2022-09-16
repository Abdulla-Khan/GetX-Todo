import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/binding/binding.dart';

import 'view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBinding(),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
