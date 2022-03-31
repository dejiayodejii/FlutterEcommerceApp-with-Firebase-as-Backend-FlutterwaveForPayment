// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, avoid_print

import 'package:ecommerce_app/controller/authcontroller.dart';
import 'package:ecommerce_app/screens/login.dart';
import 'package:ecommerce_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationScreen extends GetWidget<AuthController> {
  RegistrationScreen({Key? key}) : super(key: key);

  TextEditingController? nameController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70, bottom: 40),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                    height: 60,
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Image.asset('assets/images/logo.png')),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.50,
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
                      child: TextFormField(
                        controller: nameController,
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
                          hintText: 'Name',
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
                      child: TextFormField(
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
                      child: TextFormField(
                        controller: passwordController,
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
                          print(nameController!.text);
                          print(1);

                          controller.createUser(nameController!.text,
                              emailController!.text, passwordController!.text);
                        },
                        child: Text(
                          'Register',
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
                  Text('Already have an account?',
                      style: TextStyle(color: Colors.black)),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => LoginScreen());
                      },
                      child: Text('Sign in',
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
