import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final Box _box = Hive.box('cartBox');

  List<Product> get cartItems => _box.values.cast<Product>().toList();

  void addToCart(Product product) {
    _box.put(product.id, product);
    notifyListeners();
  }

  void removeFromCart(int id) {
    _box.delete(id);
    notifyListeners();
  }

  bool isInCart(int id) => _box.containsKey(id);
}
