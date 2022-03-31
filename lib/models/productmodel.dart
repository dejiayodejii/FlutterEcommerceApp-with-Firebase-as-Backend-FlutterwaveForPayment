
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel{
  String? brand;
  String? id;
  String? name;
  int? price;
  String? image;

  ProductModel({this.brand,this.id,this.image,this.name,this.price});

  ProductModel.fromDocumentSnapshot(DocumentSnapshot? doc){
    brand = doc!['brand'];
    id =  doc['id'];
    name =  doc['name'];
    price =  doc['price'];
    image =  doc['image'];
    

  }
}