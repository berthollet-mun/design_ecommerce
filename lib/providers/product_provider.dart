import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  List<Product> _filteredProducts = [];
  bool _isLoading = false;
  String _searchQuery = '';
  String _selectedCategory = 'All';
  String _selectedBrand = 'All';
  String _selectedGender = 'All';
  RangeValues _priceRange = const RangeValues(0, 5000);

  // Getters
  List<Product> get products => _searchQuery.isEmpty && _isFilterActive
      ? _filteredProducts
      : _getSearchResults();

  List<Product> get allProducts => _products;
  bool get isLoading => _isLoading;
  String get searchQuery => _searchQuery;
  String get selectedCategory => _selectedCategory;
  String get selectedBrand => _selectedBrand;
  String get selectedGender => _selectedGender;
  RangeValues get priceRange => _priceRange;

  bool get _isFilterActive =>
      _selectedCategory != 'All' ||
      _selectedBrand != 'All' ||
      _selectedGender != 'All' ||
      _priceRange != const RangeValues(0, 5000);

  List<Product> _getSearchResults() {
    if (_searchQuery.isEmpty) return _filteredProducts;
    return _filteredProducts.where((product) {
      return product.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          product.category.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          product.brand.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  // Load products
  void loadProducts(List<Product> products) {
    _products = products;
    _filteredProducts = products;
    notifyListeners();
  }

  // Search
  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  // Filter methods
  void setCategory(String category) {
    _selectedCategory = category;
    _applyFilters();
  }

  void setBrand(String brand) {
    _selectedBrand = brand;
    _applyFilters();
  }

  void setGender(String gender) {
    _selectedGender = gender;
    _applyFilters();
  }

  void setPriceRange(RangeValues range) {
    _priceRange = range;
    _applyFilters();
  }

  void _applyFilters() {
    _filteredProducts = _products.where((product) {
      final matchesCategory = _selectedCategory == 'All' ||
          product.category.toLowerCase() == _selectedCategory.toLowerCase();
      final matchesBrand = _selectedBrand == 'All' ||
          product.brand.toLowerCase() == _selectedBrand.toLowerCase();
      final matchesGender = _selectedGender == 'All' ||
          product.gender.toLowerCase() == _selectedGender.toLowerCase();
      final matchesPrice = product.price >= _priceRange.start &&
          product.price <= _priceRange.end;

      return matchesCategory && matchesBrand && matchesGender && matchesPrice;
    }).toList();
    notifyListeners();
  }

  void clearFilters() {
    _selectedCategory = 'All';
    _selectedBrand = 'All';
    _selectedGender = 'All';
    _priceRange = const RangeValues(0, 5000);
    _searchQuery = '';
    _filteredProducts = _products;
    notifyListeners();
  }

  // Get products by category
  List<Product> getProductsByCategory(String category) {
    return _products
        .where((product) => product.category.toLowerCase() == category.toLowerCase())
        .toList();
  }

  // Get popular products
  List<Product> get popularProducts {
    return _products.where((product) => product.isPopular).toList();
  }

  // Get new arrivals
  List<Product> get newArrivals {
    return _products.where((product) => product.isNew).toList();
  }

  // Get product by id
  Product? getProductById(String id) {
    try {
      return _products.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get related products
  List<Product> getRelatedProducts(String productId, {int limit = 4}) {
    final product = getProductById(productId);
    if (product == null) return [];

    return _products
        .where((p) =>
            p.id != productId &&
            (p.category == product.category || p.brand == product.brand))
        .take(limit)
        .toList();
  }
}
