import 'package:easypizzaa/models/pizza.dart';
import 'package:flutter/material.dart';

class CartedPizza extends ChangeNotifier {
  final List<Pizza> _cartedPizzas = [];
  double montantTotal = 0;
  List<Pizza> get pizzas => _cartedPizzas;

  

  void addPizzaToCart(Pizza pizza) {
    
    _cartedPizzas.add(pizza);
    montantTotal += pizza.price;
    notifyListeners();
  }

  void removePizzaToCart(Pizza pizza) {
    if(_cartedPizzas.contains(pizza)){
      _cartedPizzas.remove(pizza);
      montantTotal -= pizza.price;
    }
    notifyListeners();
  }
}