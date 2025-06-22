
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{
  final List<Map<String,dynamic>> product = [];


  void addToCart(Map<String,dynamic> cart){
    product.add(cart);
    notifyListeners();
  }

  void removeFromCart(Map<String,dynamic> cart){
    product.remove(cart);
    notifyListeners();
  }

}