import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double? originalPrice;
  final String category;
  final String brand;
  final List<String> images;
  final double rating;
  final int reviewCount;
  final List<String> sizes;
  final List<Color> colors;
  final bool isNew;
  final bool isPopular;
  final int stockQuantity;
  final String gender;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.originalPrice,
    required this.category,
    required this.brand,
    required this.images,
    this.rating = 0.0,
    this.reviewCount = 0,
    required this.sizes,
    required this.colors,
    this.isNew = false,
    this.isPopular = false,
    required this.stockQuantity,
    required this.gender,
  });

  double get discountPercentage {
    if (originalPrice == null || originalPrice == 0) return 0;
    return ((originalPrice! - price) / originalPrice! * 100).roundToDouble();
  }

  bool get hasDiscount => originalPrice != null && originalPrice! > price;
}

class CartItem {
  final Product product;
  int quantity;
  String? selectedSize;
  Color? selectedColor;

  CartItem({
    required this.product,
    this.quantity = 1,
    this.selectedSize,
    this.selectedColor,
  });

  double get totalPrice => product.price * quantity;
}

class Category {
  final String id;
  final String name;
  final String icon;
  final int productCount;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    this.productCount = 0,
  });
}

class User {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? avatar;
  final List<String> addresses;
  final List<String> wishlist;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.avatar,
    this.addresses = const [],
    this.wishlist = const [],
  });
}

class Order {
  final String id;
  final List<CartItem> items;
  final double total;
  final String status;
  final DateTime orderDate;
  final String? shippingAddress;
  final String paymentMethod;

  Order({
    required this.id,
    required this.items,
    required this.total,
    required this.status,
    required this.orderDate,
    this.shippingAddress,
    required this.paymentMethod,
  });
}

// Mock Data
class MockData {
  static List<Product> get products => [
    Product(
      id: '1',
      name: 'Classic Panjabi',
      description:
          'Traditional cotton panjabi with modern design. Perfect for festivals and special occasions.',
      price: 1500,
      originalPrice: 1900,
      category: 'Panjabi',
      brand: 'ManMode',
      images: ['assets/images/product1.png'],
      rating: 4.5,
      reviewCount: 13,
      sizes: ['S', 'M', 'L', 'XL', 'XXL'],
      colors: [Colors.brown, Colors.black, Colors.white],
      isPopular: true,
      stockQuantity: 50,
      gender: 'Men',
    ),
    Product(
      id: '2',
      name: 'Premium T-Shirt',
      description: 'High-quality cotton t-shirt with comfortable fit.',
      price: 600,
      originalPrice: 800,
      category: 'T-Shirt',
      brand: 'Nike',
      images: ['assets/images/product2.png'],
      rating: 4.2,
      reviewCount: 8,
      sizes: ['S', 'M', 'L', 'XL'],
      colors: [Colors.white, Colors.black, Colors.grey, Colors.blue],
      isNew: true,
      stockQuantity: 100,
      gender: 'Men',
    ),
    Product(
      id: '3',
      name: 'Slim Fit Jeans',
      description: 'Modern slim fit jeans with stretch fabric.',
      price: 1200,
      originalPrice: 1500,
      category: 'Jeans',
      brand: 'Levi\'s',
      images: ['assets/images/product3.png'],
      rating: 4.7,
      reviewCount: 25,
      sizes: ['28', '30', '32', '34', '36'],
      colors: [Colors.blue, Colors.black, Colors.grey],
      isPopular: true,
      stockQuantity: 75,
      gender: 'Men',
    ),
    Product(
      id: '4',
      name: 'Running Shoes',
      description: 'Lightweight running shoes with breathable mesh.',
      price: 2500,
      originalPrice: 3200,
      category: 'Shoes',
      brand: 'Nike',
      images: ['assets/images/product4.png'],
      rating: 4.8,
      reviewCount: 42,
      sizes: ['7', '8', '9', '10', '11'],
      colors: [Colors.white, Colors.black, Colors.red],
      isPopular: true,
      isNew: true,
      stockQuantity: 30,
      gender: 'Men',
    ),
    Product(
      id: '5',
      name: 'Sports Watch',
      description: 'Digital sports watch with water resistance.',
      price: 1800,
      category: 'Watch',
      brand: 'Casio',
      images: ['assets/images/product5.png'],
      rating: 4.3,
      reviewCount: 15,
      sizes: ['One Size'],
      colors: [Colors.black, Colors.grey.shade400],
      stockQuantity: 20,
      gender: 'Men',
    ),
    Product(
      id: '6',
      name: 'Kids Polo Shirt',
      description: 'Comfortable polo shirt for kids.',
      price: 450,
      originalPrice: 600,
      category: 'T-Shirt',
      brand: 'Polo',
      images: ['assets/images/product6.png'],
      rating: 4.4,
      reviewCount: 12,
      sizes: ['4-5Y', '6-7Y', '8-9Y', '10-12Y'],
      colors: [Colors.red, Colors.blue, Colors.white, Colors.green],
      stockQuantity: 60,
      gender: 'Kids',
    ),
    Product(
      id: '7',
      name: 'Kids Sneakers',
      description: 'Colorful sneakers for active kids.',
      price: 800,
      originalPrice: 1000,
      category: 'Shoes',
      brand: 'Bata',
      images: ['assets/images/product7.png'],
      rating: 4.6,
      reviewCount: 20,
      sizes: ['13C', '1Y', '2Y', '3Y'],
      colors: [Colors.blue, Colors.red, Colors.green],
      isNew: true,
      stockQuantity: 40,
      gender: 'Kids',
    ),
    Product(
      id: '8',
      name: 'Formal Shirt',
      description: 'Classic formal shirt for office wear.',
      price: 900,
      originalPrice: 1200,
      category: 'T-Shirt',
      brand: 'Arrow',
      images: ['assets/images/product8.png'],
      rating: 4.1,
      reviewCount: 18,
      sizes: ['S', 'M', 'L', 'XL'],
      colors: [Colors.white, Colors.lightBlue, Colors.pink.shade100],
      stockQuantity: 45,
      gender: 'Men',
    ),
  ];

  static List<Category> get categories => [
    Category(id: '1', name: 'T-Shirt', icon: '👕', productCount: 25),
    Category(id: '2', name: 'Jeans', icon: '👖', productCount: 18),
    Category(id: '3', name: 'Shoes', icon: '👟', productCount: 30),
    Category(id: '4', name: 'Panjabi', icon: '👘', productCount: 12),
    Category(id: '5', name: 'Watch', icon: '⌚', productCount: 15),
    Category(id: '6', name: 'Accessories', icon: '🎒', productCount: 20),
  ];

  static List<String> get brands => [
    'All',
    'Nike',
    'Adidas',
    'Puma',
    'Bata',
    'Levi\'s',
    'ManMode',
    'Polo',
    'Arrow',
    'Casio',
  ];

  static List<String> get paymentMethods => [
    'Bank Transfer',
    'Mobile Banking',
    'Credit/Debit Card',
    'Payoneer',
    'Amazon Hub Counter',
    'Apple Pay',
    'Google Pay',
    'Cash on Delivery',
  ];
}
