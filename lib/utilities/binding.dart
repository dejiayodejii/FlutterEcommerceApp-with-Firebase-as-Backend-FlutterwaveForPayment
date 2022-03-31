import 'package:ecommerce_app/controller/authcontroller.dart';

import 'package:ecommerce_app/controller/usermodel_controller.dart';
import 'package:get/get.dart';


class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<UserController>(UserController(), permanent: true); 
   
  }
}