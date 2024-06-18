import 'package:easypizzaa/liked_pizza.dart';
import 'package:easypizzaa/screens/carted_pizza.dart';
import 'package:easypizzaa/screens/pizza_cart.dart';
import 'package:easypizzaa/screens/pizza_details.dart';
import 'package:easypizzaa/screens/pizza_master.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => LikedPizza()),
      ChangeNotifierProvider(create: (context)=> CartedPizza())
    ],
      child: const MyApp(),
    ),
  );
}

final GoRouter _router = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const PizzaMaster();
    },
    routes: <RouteBase>[
      GoRoute(
        path: 'details/:pizzaId',
        builder: (BuildContext context, GoRouterState state) {
          return PizzaDetails(
            pizzaId: state.pathParameters['pizzaId']!,
          );
        },
        
  ),
  GoRoute(
        path: 'cart',
        builder: (BuildContext context, GoRouterState state) {
          return const PizzaCart();
        },
        
  )
],

)
]
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
