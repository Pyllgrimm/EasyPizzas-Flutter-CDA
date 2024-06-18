import 'package:easypizzaa/liked_pizza.dart';
import 'package:flutter/material.dart';
import 'package:easypizzaa/data/pizzas.dart' as db;
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PizzaMaster extends StatelessWidget {
  const PizzaMaster({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber[800],toolbarHeight: 250,
        title: const Center(child: Image(image: AssetImage('images/pizzalogo.png'),height: 300,)),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: db.pizzas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(db.pizzas[index].price.toStringAsFixed(2)),
                      title: Text(db.pizzas[index].name),
                      subtitle:
                      Row(
                        children: [
                          Text("${db.pizzas[index].ingredients.length} Ingrédients",),
                          
                          
                      ],),
                      trailing:
                          Consumer<LikedPizza>(builder: (context, likedpizza, child) {
                        return Icon(Icons.favorite,
                            color: likedpizza.isFavorite(db.pizzas[index].pizzaId)
                                ? Colors.red
                                : Colors.black);
                      }),
                      // ignore: avoid_print
                      onTap: () => context.go('/details/${db.pizzas[index].pizzaId}'),
                    );
                  }
                ),
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
