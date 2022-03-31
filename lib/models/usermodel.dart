import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/models/cartItem_model.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  List<CartItemModel>? cart;

  UserModel({this.id, this.name, this.email,this.cart});

  UserModel.fromDocumentSnapshot(DocumentSnapshot? documentSnapshot) {
    id = documentSnapshot!.id;
    name = documentSnapshot["name"];
    email = documentSnapshot["email"];
    cart = _convertCartItems(documentSnapshot["cart"]);
  }

  List<CartItemModel> _convertCartItems(List cartFomDb){
    List<CartItemModel> _result = [];
    if(cartFomDb.isNotEmpty){
      for (var element in cartFomDb) {
      _result.add(CartItemModel.fromMap(element));
    }
    }
    return _result;
  }

  //List cartItemsToJson() => cart!.map((item) => item.toJson()).toList();


}