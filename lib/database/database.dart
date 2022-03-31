// ignore_for_file: prefer_final_fields, avoid_print, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/cartItem_model.dart';
import 'package:ecommerce_app/models/productmodel.dart';

import 'package:ecommerce_app/models/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBase {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var firebaseUser = FirebaseAuth.instance.currentUser;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(firebaseUser!.uid).set({
        "name": user.name,
        "email": user.email,
        "cart": [],
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Stream<List<CartItemModel>> getCartDetails() {
    return _firestore
        .collection('users')
        .doc(firebaseUser!.uid)
        .snapshots()
        .map((DocumentSnapshot snapshot) {
      print(snapshot.data());
      List<CartItemModel> cart = [];
      List str = snapshot['cart'];
      for (var i in str) {
        CartItemModel cartItemModel = CartItemModel(
          productId: i['productId'],
          image: i['image'],
          cost: i['cost'],
          id: i['id'],
          quantity: i['quantity'],
          name: i['name'],
          price: i['price'],
        );
        cart.add(cartItemModel);
      }
      return cart;
    });
  }

  Future updateCart(Map<String, dynamic> data) async {
    await _firestore.collection('users').doc(firebaseUser!.uid).update(data);
  }

  Stream<List<ProductModel>> getProduct() {
    return _firestore
        .collection('products')
        .snapshots()
        .map((QuerySnapshot query) {
      List<ProductModel> productList = [];
      query.docs.forEach((element) {
        ProductModel doc = ProductModel(
          brand: element['brand'],
          id: element['id'],
          name: element['name'],
          price: element['price'],
          image: element['image'],
        );
        productList.add(doc);
      });

      return productList;
    });
  }
}
















/*   Future<bool> addToCart(ProductModel product, String quantity) async {
    try {
      var doc =
          await _firestore.collection('Carts').doc(firebaseUser!.email).get();
      print(firebaseUser!.email);

      if (doc.exists) {
        await _firestore.collection('Carts').doc(firebaseUser!.email).update({
          'cartItems': FieldValue.arrayUnion([
            {
              'name': product.name,
              'price': product.price,
              'quantity': 'quantity',
              'image': product.image,
            }
          ])
        });
      } else {
        await _firestore.collection('Carts').doc(firebaseUser!.email).set({
          'cartItems': [
            {
              'name': product.name,
              'price': product.price,
              'quantity': '1',
              'image': product.image,
            }
          ],
        });
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<ProductModel>> getCartItems() async {
    List<ProductModel> cartItemm = [];

    DocumentSnapshot snapshot =
        await _firestore.collection('Carts').doc(firebaseUser!.email).get();

    if (snapshot.exists) {
      var cartItems = await _firestore
          .collection('Carts')
          .doc(firebaseUser!.email)
          .get()
          .then((doc) => doc.data()!['cartItems']);
      if (cartItems.isNotEmpty) {
        for (dynamic group in cartItems) {
          ProductModel productModel = ProductModel(
            brand: group['brand'],
            id: group['id'],
            name: group['name'],
            price: group['price'],
            image: group['image'],
          );
          cartItemm.add(productModel);
        }
      }
    } else {
      print('i no exist o');
    }
    return cartItemm;
  } */
