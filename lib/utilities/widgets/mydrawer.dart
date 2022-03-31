// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app/controller/authcontroller.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            accountName: Text("Ayodeji"),
            accountEmail: Text("dejiayodeji!@gmail.com")),
        ListTile(
          leading: Icon(Icons.book),
          title: Text(
            "Payments History",
            style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.normal),
          ),
          onTap: () async {},
        ),
        ListTile(
          onTap: () {
            controller.signOut();
          },
          leading: Icon(Icons.exit_to_app),
          title: Text("Log out"),
        )
      ],
    ));
  }
}