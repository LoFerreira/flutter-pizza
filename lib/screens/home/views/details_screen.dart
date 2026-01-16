import 'package:flutter/material.dart';
import 'package:flutter_pizza_app/components/macro.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza_repository/pizza_repository.dart';

class DetailsScreen extends StatelessWidget {
  final Pizza pizza;
  const DetailsScreen({super.key, required this.pizza});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.surface),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width - 32,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(3, 3),
                    blurRadius: 5,
                    color: Colors.grey,
                  ),
                ],
                image: DecorationImage(image: NetworkImage(pizza.picture)),
              ),
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(3, 3),
                    blurRadius: 5,
                    color: Colors.grey,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            pizza.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              children: [
                                Text(
                                  '\$${(pizza.price - (pizza.price * pizza.discount / 100)).toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                ),
                                Text(
                                  '\$${pizza.price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        MyMacroWidget(
                          title: 'Calories',
                          value: pizza.macros.calories,
                          icon: FontAwesomeIcons.fire,
                        ),
                        SizedBox(width: 10),
                        MyMacroWidget(
                          title: 'Protein',
                          value: pizza.macros.proteins,
                          icon: FontAwesomeIcons.dumbbell,
                        ),
                        SizedBox(width: 10),
                        MyMacroWidget(
                          title: 'Fat',
                          value: pizza.macros.fats,
                          icon: FontAwesomeIcons.oilWell,
                        ),
                        SizedBox(width: 10),
                        MyMacroWidget(
                          title: 'Carbs',
                          value: pizza.macros.carbs,
                          icon: FontAwesomeIcons.breadSlice,
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 58,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          elevation: 3.0,
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Buy Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
