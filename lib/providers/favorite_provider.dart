import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/product.dart';

class FavoriteProvider with ChangeNotifier {
  final Box _box = Hive.box('favoriteBox');

  List<Product> get favoriteItems => _box.values.cast<Product>().toList();

  void addToFavorite(Product product) {
    _box.put(product.id, product);
    notifyListeners();
  }

  void removeFromFavorite(int id) {
    _box.delete(id);
    notifyListeners();
  }

  bool isFavorite(int id) => _box.containsKey(id);
}
