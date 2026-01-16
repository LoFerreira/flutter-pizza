import 'package:pizza_repository/src/entities/entities.dart';
import 'package:pizza_repository/src/models/models.dart';

class PizzaEntity {
  String pizzaId;
  String picture;
  String name;
  String description;
  int price;
  int discount;
  bool isVeg;
  int spicy;
  Macros macros;

  PizzaEntity({
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

  Map<String, Object?> toDocument() {
    return {
      'pizzaId': pizzaId,
      'picture': picture,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'isVeg': isVeg,
      'spicy': spicy,
      'macros': macros.toEntity().toDocument(),
    };
  }

  static PizzaEntity fromDocument(Map<String, dynamic> doc) {
    return PizzaEntity(
      pizzaId: doc['pizzaId'],
      picture: doc['picture'],
      name: doc['name'],
      description: doc['description'],
      price: doc['price'],
      discount: doc['discount'],
      isVeg: doc['isVeg'],
      spicy: doc['spicy'],
      macros: Macros.fromEntity(MacrosEntity.fromDocument(doc['macros'])),
    );
  }
}
