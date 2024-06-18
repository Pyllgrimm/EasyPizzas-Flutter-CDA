import 'package:uuid/v4.dart';


class Pizza {
  String name;
  double price;
  List <String> ingredients;
  Category category;
  String pizzaId;
  
  Pizza({required this.name, required this.price, required this.ingredients, required this.category}) : pizzaId =  const UuidV4().generate();
}
enum Category {
  rossa,
  bianca,
  veggie
  }