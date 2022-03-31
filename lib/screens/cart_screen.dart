// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/utilities/widgets/cart_item_widget.dart';

import 'package:ecommerce_app/utilities/widgets/custombutton.dart';
import 'package:ecommerce_app/utilities/widgets/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    Key? key,
    required CartController cartController,
  })  : _cartController = cartController,
        super(key: key);

  final CartController _cartController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: CustomText(
                text: "Shopping Cart",
                size: 24,
                weight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Obx(() => _cartController.cartList.isEmpty
                ? Text('No Item inside cart')
                : Column(
                    children: _cartController.cartList.map((cartItem) {
                      return CartItemWidget(
                        cartItem: cartItem,
                      );
                    }).toList(),
                  )),
          ],
        ),
        Positioned(
          bottom: 20,
          child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(8),
              child: Obx(
                () => CustomButton(
                    text:
                        "Pay \$${_cartController.totalCartPrice.value.toStringAsFixed(2)}",
                    onTap: () {}),
              )),
        ),
      ],
    );
  }
}
