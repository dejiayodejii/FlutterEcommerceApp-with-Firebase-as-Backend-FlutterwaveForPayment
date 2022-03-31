import 'package:ecommerce_app/controller/authcontroller.dart';
import 'package:ecommerce_app/screens/home_screen.dart';
import 'package:ecommerce_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootFolder extends GetWidget<AuthController> {
  const RootFolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => (Get.find<AuthController>().user != null)
        ?  HomeScreen()
        : LoginScreen());
  }
}
