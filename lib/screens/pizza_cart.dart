import 'package:easypizzaa/screens/carted_pizza.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PizzaCart extends StatelessWidget {
  const PizzaCart({super.key});

  @override
  Widget build(BuildContext context) {
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
            Consumer<CartedPizza>(builder: (context, cartedpizza, child) {
              return Expanded(
                  child: ListView.builder(
                      itemCount: cartedpizza.pizzas.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Image(
                            image: AssetImage('images/pizza.png'),
                          ),
                          title: Text(
                            cartedpizza.pizzas[index].name,
                            style: const TextStyle(fontSize: 24),
                          ),
                          trailing: Text(
                            '${cartedpizza.pizzas[index].price} €',
                            style: const TextStyle(fontSize: 24),
                          ),
                          subtitle: Row(
                            children: [
                              Consumer<CartedPizza>(
                                builder: (context, cartedpizza, child) {
                                  return IconButton(
                                      onPressed: () {
                                        Provider.of<CartedPizza>(context,
                                                listen: false)
                                            .addPizzaToCart(
                                                cartedpizza.pizzas[index]);
                                      },
                                      icon: const Icon(
                                        Icons.plus_one,
                                        size: 16,
                                      ));
                                },
                              ),
                              Consumer<CartedPizza>(
                                builder: (context, cartedpizza, child) {
                                  return IconButton(
                                      onPressed: () {
                                        Provider.of<CartedPizza>(context,
                                                listen: false)
                                            .removePizzaToCart(
                                                cartedpizza.pizzas[index]);
                                      },
                                      icon: const Icon(
                                        Icons.exposure_neg_1_outlined,
                                        size: 16,
                                      ));
                                },
                              ),
                            ],
                          ),
                        );
                      }));
            }),
            Consumer<CartedPizza>(builder: (context, cartedpizza, child) {
              return Text(
                'Total : ${cartedpizza.montantTotal} €',
                style: const TextStyle(fontSize: 24),
              );
            }),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go back to the Home screen'),
            ),
          ],
        ),
      ),
    );
  }
}
