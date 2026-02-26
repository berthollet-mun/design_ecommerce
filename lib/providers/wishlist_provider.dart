import 'package:flutter/material.dart';
import '../models/product_model.dart';

class WishlistProvider with ChangeNotifier {
  final List<Product> _wishlist = [];

  List<Product> get wishlist => List.unmodifiable(_wishlist);

  int get count => _wishlist.length;

  bool isInWishlist(String productId) {
    return _wishlist.any((product) => product.id == productId);
  }

  void toggleWishlist(Product product) {
    if (isInWishlist(product.id)) {
      _wishlist.removeWhere((p) => p.id == product.id);
    } else {
      _wishlist.add(product);
    }
    notifyListeners();
  }

  void addToWishlist(Product product) {
    if (!isInWishlist(product.id)) {
      _wishlist.add(product);
      notifyListeners();
    }
  }

  void removeFromWishlist(String productId) {
    _wishlist.removeWhere((product) => product.id == productId);
    notifyListeners();
  }

  void clearWishlist() {
    _wishlist.clear();
    notifyListeners();
  }
}
