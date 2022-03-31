// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/database/database.dart';
import 'package:ecommerce_app/models/cartItem_model.dart';
import 'package:ecommerce_app/models/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class CartController extends GetxController {
  RxDouble totalCartPrice = 0.0.obs;
  DataBase dataBase = DataBase();

  var cartList = <CartItemModel>[].obs;

  @override
  void onReady() {
    super.onReady();
    cartList.bindStream(dataBase.getCartDetails());
    ever(cartList, changeCartTotalPrice);
  }

  @override
  void dispose() {
    clear();
    super.dispose();
  }

  void clear() {
    cartList.value = [];
  }

  void addProductToCart(ProductModel product) async {
    try {
      if (_isItemAlreadyAdded(product)) {
        Get.snackbar(
          "Check your cart",
          "${product.name} is already added",
          borderColor: Colors.black,
          borderWidth: 1,
          backgroundColor: Colors.lightBlue
        );
      } else {
        String itemId = const Uuid().v1();

        await dataBase.updateCart({
          "cart": FieldValue.arrayUnion([
            {
              "id": itemId,
              "productId": product.id,
              "name": product.name,
              "quantity": 1,
              "price": product.price,
              "image": product.image,
              "cost": product.price,
            }
          ])
        });
        Get.snackbar(
          "Item added",
          "${product.name} was added to your cart",
          borderColor: Colors.black,
          borderWidth: 1,
        );
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        "Error",
        "Cannot add this item",
        borderColor: Colors.black,
        borderWidth: 1,
      );
    }
  }

  changeCartTotalPrice(List<CartItemModel> cartList) {
    totalCartPrice.value = 0.0;
    if (cartList.isNotEmpty) {
      for (var cartItem in cartList) {
        totalCartPrice.value += cartItem.cost;
      }
    }
  }

  bool _isItemAlreadyAdded(ProductModel product) {
    if (cartList.isNotEmpty) {
      return cartList.where((item) => item.productId == product.id).isNotEmpty;
    } else {
      print('not added yet');
      return false;
    }
  }

  void removeCartItem(CartItemModel cartItem) {
    try {
      dataBase.updateCart({
        "cart": FieldValue.arrayRemove([cartItem.toJson()])
      });
    } catch (e) {
      Get.snackbar("Error", "Cannot remove this item");
    }
  }

  void decreaseQuantity(CartItemModel item) {
    try {
      if (item.quantity == 1) {
        removeCartItem(item);
      } else {
        removeCartItem(item);
        item.quantity--;
        dataBase.updateCart({
          "cart": FieldValue.arrayUnion([item.toJson()])
        });
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void increaseQuantity(CartItemModel item) async {
    try {
      removeCartItem(item);

      item.quantity++;

      await dataBase.updateCart({
        "cart": FieldValue.arrayUnion([item.toJson()])
      });
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
