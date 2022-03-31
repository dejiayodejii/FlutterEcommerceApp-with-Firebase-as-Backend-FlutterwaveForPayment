// ignore_for_file: constant_identifier_names

class CartItemModel {

    static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const QUANTITY = "quantity";
  static const COST = "cost";
  static const PRICE = "price";
  static const PRODUCT_ID = "productId";



  late String id;
  late String image;
  late String name;
  late int quantity;
  late int cost;
  late String productId;
  late int price;

  CartItemModel(
      {required this.productId,
      required this.id,
      required this.image,
      required this.name,
      required this.quantity,
      required this.cost,
      required this.price});

  CartItemModel.fromMap(Map<String, dynamic> data) {
    id = data[id];
    image = data[image];
    name = data[name];
    quantity = data[quantity];
    cost = data[cost];
    productId = data[productId];
    price = data[price];
  }

  Map toJson() => {
        ID: id,
        PRODUCT_ID: productId,
        IMAGE: image,
        NAME: name,
        QUANTITY: quantity,
        COST: price * quantity,
        PRICE: price
      };
}
