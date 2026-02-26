import 'package:flutter/material.dart';
import '../models/product_model.dart';

class AuthProvider with ChangeNotifier {
  User? _currentUser;
  bool _isAuthenticated = false;
  bool _isLoading = false;

  User? get currentUser => _currentUser;
  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;

  // Mock login
  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // Mock validation
    if (email.isNotEmpty && password.length >= 6) {
      _currentUser = User(
        id: '1',
        name: 'John Doe',
        email: email,
        phone: '+1234567890',
        avatar: 'https://i.pravatar.cc/150?img=11',
        addresses: ['123 Main St, City, Country'],
        wishlist: [],
      );
      _isAuthenticated = true;
      _isLoading = false;
      notifyListeners();
      return true;
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  // Mock signup
  Future<bool> signup(String name, String email, String phone, String password) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    if (name.isNotEmpty && email.isNotEmpty && password.length >= 6) {
      _currentUser = User(
        id: '1',
        name: name,
        email: email,
        phone: phone,
        avatar: 'https://i.pravatar.cc/150?img=11',
        addresses: [],
        wishlist: [],
      );
      _isAuthenticated = true;
      _isLoading = false;
      notifyListeners();
      return true;
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  // Logout
  void logout() {
    _currentUser = null;
    _isAuthenticated = false;
    notifyListeners();
  }

  // Update user profile
  void updateProfile({String? name, String? phone, String? avatar}) {
    if (_currentUser != null) {
      _currentUser = User(
        id: _currentUser!.id,
        name: name ?? _currentUser!.name,
        email: _currentUser!.email,
        phone: phone ?? _currentUser!.phone,
        avatar: avatar ?? _currentUser!.avatar,
        addresses: _currentUser!.addresses,
        wishlist: _currentUser!.wishlist,
      );
      notifyListeners();
    }
  }

  // Add address
  void addAddress(String address) {
    if (_currentUser != null) {
      final addresses = [..._currentUser!.addresses, address];
      _currentUser = User(
        id: _currentUser!.id,
        name: _currentUser!.name,
        email: _currentUser!.email,
        phone: _currentUser!.phone,
        avatar: _currentUser!.avatar,
        addresses: addresses,
        wishlist: _currentUser!.wishlist,
      );
      notifyListeners();
    }
  }

  // Check if email exists (mock)
  Future<bool> checkEmailExists(String email) async {
    await Future.delayed(const Duration(seconds: 1));
    return false; // Mock: email doesn't exist
  }

  // Reset password (mock)
  Future<bool> resetPassword(String email) async {
    await Future.delayed(const Duration(seconds: 2));
    return email.isNotEmpty;
  }

  // Change password (mock)
  Future<bool> changePassword(String currentPassword, String newPassword) async {
    await Future.delayed(const Duration(seconds: 2));
    return newPassword.length >= 6;
  }
}
