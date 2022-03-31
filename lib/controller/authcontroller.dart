import 'package:ecommerce_app/controller/usermodel_controller.dart';
import 'package:ecommerce_app/database/database.dart';
import 'package:ecommerce_app/models/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final Rxn<User> _firebaseUser = Rxn<User>();

  User? get user {
    return _firebaseUser.value;
  }

  @override
  void onInit() {
    _firebaseUser.bindStream(_firebaseAuth.userChanges());
    super.onInit();
  }

  void createUser(String name, String email, String password) async {
    try {
      UserCredential _authResult =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: email.trim(), password: password);

      UserModel _user = UserModel(
        id: _authResult.user!.uid,
        name: name,
        email: _authResult.user!.email,
      );

      if (await DataBase().createNewUser(_user)) {
        Get.find<UserController>().myUserModelValue = _user;
        Get.back();
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error creating Account",
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email.trim(), password: password);

     /*  Get.find<UserController>().myUserModelValue =
          await DataBase().getExistinUserDetails(); */
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error signing in",
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error signing out",
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
