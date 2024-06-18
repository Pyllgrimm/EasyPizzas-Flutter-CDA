import 'package:flutter/material.dart';

class LikedPizza extends ChangeNotifier {
  final List<String> _likedPizzas = [];

  List<String> get pizzas => _likedPizzas;

  bool isFavorite(String pizzaId) {

    return _likedPizzas.contains(pizzaId);
  }

  void addFavorite(String pizzaId) {
    if (!isFavorite(pizzaId)) {
      _likedPizzas.add(pizzaId);
    }
    else{
      _likedPizzas.remove(pizzaId);
    }
    notifyListeners();
  }
}
