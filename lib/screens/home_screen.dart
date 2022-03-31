// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, avoid_print

import 'package:ecommerce_app/controller/authcontroller.dart';
import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/controller/productcontroller.dart';
import 'package:ecommerce_app/screens/cart_screen.dart';
import 'package:ecommerce_app/utilities/widgets/customtext.dart';
import 'package:ecommerce_app/utilities/widgets/mydrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeScreen extends GetWidget<AuthController> {
  HomeScreen({Key? key}) : super(key: key);

  // ignore: unused_field
  final _productController = Get.put(ProductController());
  final _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Sneex",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () async {
                
                showBarModalBottomSheet(
                  context: context,
                  builder: (context) =>
                      CartPage(cartController: _cartController),
                );
              })
        ],
        elevation: 1,
        centerTitle: true,
      ),
      drawer: MyDrawer(controller: controller),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(top: 10),
        child: Obx(
          () => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.7, crossAxisCount: 2),
            itemCount: _productController.productList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: 10, bottom: 10, left: 10),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    offset: Offset(3, 2),
                    blurRadius: 7,
                  ),
                ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              _productController.productList[index].image!,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _productController.productList[index].name!,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  _productController.productList[index].brand!,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text:
                                      "\$${_productController.productList[index].price}",
                                  size: 22,
                                  weight: FontWeight.bold,
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                IconButton(
                                    icon: Icon(Icons.add_shopping_cart),
                                    onPressed: () {
                                      print(_productController
                                          .productList[index].image);
                                      _cartController.addProductToCart(
                                          _productController
                                              .productList[index]);
                                    })
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      )),
    );
  }
}
