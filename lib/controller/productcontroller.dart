// ignore_for_file: prefer_final_fields, unnecessary_this, invalid_use_of_protected_member, avoid_print

import 'package:ecommerce_app/database/database.dart';
import 'package:ecommerce_app/models/productmodel.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  List<dynamic> get user => productList.value;
  var loading = false.obs;

  @override
  void onInit() {
    loading.value=true;
    productList.bindStream( DataBase().getProduct());
    loading.value=false;
    super.onInit();
  }
  
}
