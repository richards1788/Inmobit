import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_repaso/model/products.dart';

class GlobalController extends GetxController {
  List<Product> _products = [];
  List<Product> get products => _products;

  @override
  void onInit() {
    super.onInit();
    print('onInit');
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final String productsString =
        await rootBundle.loadString('assets/products.json');

    this._products = (jsonDecode(productsString) as List)
        .map((e) => Product.fromJson(e))
        .toList();
  }
}
