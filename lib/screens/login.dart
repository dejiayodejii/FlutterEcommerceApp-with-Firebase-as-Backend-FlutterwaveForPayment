// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_app/controller/authcontroller.dart';
import 'package:ecommerce_app/screens/registration.dart';
import 'package:ecommerce_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginScreen extends GetWidget<AuthController> {

  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, bottom: 40),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.40,
                padding: EdgeInsets.all(25),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.5),
                        blurRadius: 10,
                      )
                    ],
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey.withOpacity(.3),
                      ),
                      child: TextField(
                        controller: emailController,
                        cursorColor: Colors.grey,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          fillColor: Colors.blue,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          contentPadding: EdgeInsets.all(20),
                          hintText: 'Email',
                          hintStyle: kBodyText,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey.withOpacity(.3),
                      ),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        cursorColor: Colors.grey,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          fillColor: Colors.blue,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          contentPadding: EdgeInsets.all(20),
                          hintText: 'Password',
                          hintStyle: kBodyText,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.black,
                      ),
                      child: TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.black12,
                          ),
                        ),
                        onPressed: () {
                          controller.login(emailController.text, passwordController.text);
                        },
                        child: Text(
                          'Login',
                          style: kButtonText.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?',
                      style: TextStyle(color: Colors.black)),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => RegistrationScreen());
                      },
                      child: Text('Create account',
                          style: TextStyle(color: Colors.blue))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
