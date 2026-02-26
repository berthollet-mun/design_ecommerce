import 'package:flutter/material.dart';
import '../models/product_model.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalAmount {
    return _items.fold(0, (sum, item) => sum + item.totalPrice);
  }

  void addToCart(
    Product product, {
    String? size,
    Color? color,
    int quantity = 1,
  }) {
    final existingIndex = _items.indexWhere(
      (item) =>
          item.product.id == product.id &&
          item.selectedSize == size &&
          item.selectedColor == color,
    );

    if (existingIndex >= 0) {
      _items[existingIndex].quantity += quantity;
    } else {
      _items.add(
        CartItem(
          product: product,
          selectedSize: size,
          selectedColor: color,
          quantity: quantity,
        ),
      );
    }
    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void removeProduct(String productId) {
    _items.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

  void updateQuantity(CartItem item, int quantity) {
    if (quantity <= 0) {
      removeFromCart(item);
    } else {
      final index = _items.indexOf(item);
      if (index >= 0) {
        _items[index].quantity = quantity;
        notifyListeners();
      }
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  bool isInCart(String productId) {
    return _items.any((item) => item.product.id == productId);
  }

  int getProductQuantity(String productId) {
    final item = _items.firstWhere(
      (item) => item.product.id == productId,
      orElse: () => CartItem(
        product: Product(
          id: '',
          name: '',
          description: '',
          price: 0,
          category: '',
          brand: '',
          images: [],
          sizes: [],
          colors: [],
          stockQuantity: 0,
          gender: '',
        ),
        quantity: 0,
      ),
    );
    return item.quantity;
  }
}
