import 'package:easypizzaa/data/pizzas.dart';
import 'package:easypizzaa/models/pizza.dart';
import 'package:easypizzaa/screens/carted_pizza.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:easypizzaa/liked_pizza.dart';

// ignore: must_be_immutable
class PizzaDetails extends StatelessWidget {
  const PizzaDetails({super.key, required this.pizzaId});
  final String pizzaId;

  @override
  Widget build(BuildContext context) {
    final Pizza? pizza = getPizzaById(pizzaId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[800],
        toolbarHeight: 250,
        title: const Center(
            child: Image(
          image: AssetImage('images/pizzalogo.png'),
          height: 300,
        )),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              pizza!.name,
              style: const TextStyle(fontSize: 24),
            ),
            Expanded(
              child: ListView.builder(itemCount: pizza.ingredients.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(pizza.ingredients[index]),);
              },),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<CartedPizza>(
                  builder: (context, cartedpizza, child) {
                    return IconButton(
                      onPressed: () {
                        Provider.of<CartedPizza>(context, listen: false)
                            .addPizzaToCart(pizza);
                      },
                      icon: const Icon(
                        Icons.plus_one,
                        size: 32,
                      ));
                  },
                ),
                Consumer<CartedPizza>(
                  builder: (context, cartedpizza, child){
                    return IconButton(
                        onPressed: () {
                          Provider.of<CartedPizza>(context, listen: false)
                            .removePizzaToCart(pizza);
                        },
                        icon: const Icon(
                          Icons.exposure_neg_1_outlined,
                          size: 32,
                        ));
                  },
                ),
              ],
            ),
            Consumer<LikedPizza>(
              builder: (context, likedpizza, child) {
                return IconButton(
                  onPressed: () {
                    Provider.of<LikedPizza>(context, listen: false)
                        .addFavorite(pizzaId);
                  },
                  icon: const Icon(Icons.favorite),
                  color: likedpizza.isFavorite(pizzaId)
                      ? Colors.red
                      : Colors.black,
                );
              },
            ),
            ElevatedButton(
        onPressed: () => context.go('/cart'),
        child: const Icon(Icons.shopping_cart,
        color: Colors.black,),
      ),
          ],
        ),
      ),
    );
  }
}

Pizza? getPizzaById(String id) {
  // ignore: unrelated_type_equality_checks
  return pizzas.firstWhere((pizza) => pizza.pizzaId == id);
}
