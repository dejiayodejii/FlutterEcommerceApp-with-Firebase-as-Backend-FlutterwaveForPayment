// ignore_for_file: prefer_final_fields, unnecessary_this, invalid_use_of_protected_member
import 'package:ecommerce_app/models/usermodel.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<UserModel> _myUserModel = UserModel().obs;

  set myUserModelValue(UserModel value) {
    this._myUserModel.value = value;
  }

  UserModel get myUserModelValue {
    return _myUserModel.value;
  }

  void clear() {
    _myUserModel.value = UserModel();
  }
}
