import 'package:pizza_repository/src/entities/pizza_entity.dart';
import 'package:pizza_repository/src/models/models.dart';

class Pizza {
  String pizzaId;
  String picture;
  String name;
  String description;
  int price;
  int discount;
  bool isVeg;
  int spicy;
  Macros macros;

  Pizza({
    required this.pizzaId,
    required this.picture,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.isVeg,
    required this.spicy,
    required this.macros,
  });

  PizzaEntity toEntity() {
    return PizzaEntity(
      pizzaId: pizzaId,
      picture: picture,
      name: name,
      description: description,
      price: price,
      discount: discount,
      isVeg: isVeg,
      spicy: spicy,
      macros: macros,
    );
  }

  static Pizza fromEntity(PizzaEntity entity) {
    return Pizza(
      pizzaId: entity.pizzaId,
      picture: entity.picture,
      name: entity.name,
      description: entity.description,
      price: entity.price,
      discount: entity.discount,
      isVeg: entity.isVeg,
      spicy: entity.spicy,
      macros: entity.macros,
    );
  }
}
