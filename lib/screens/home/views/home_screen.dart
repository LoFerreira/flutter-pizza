import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pizza_app/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter_pizza_app/screens/home/blocs/get_pizza_bloc/get_pizza_bloc.dart';
import 'package:flutter_pizza_app/screens/home/views/details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Row(
          children: [
            Image.asset('assets/8.png', scale: 14),
            SizedBox(width: 8),
            Text(
              'Pizza',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.cart)),
          IconButton(
            onPressed: () {
              context.read<SignInBloc>().add(SignOutRequired());
            },
            icon: Icon(CupertinoIcons.arrow_right_to_line),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<GetPizzaBloc, GetPizzaState>(
          builder: (context, state) {
            if (state is GetPizzaSuccess) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 9 / 16,
                ),
                itemCount: state.pizzas.length,
                itemBuilder: (context, int i) {
                  return Material(
                    elevation: 3,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                DetailsScreen(pizza: state.pizzas[i]),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(state.pizzas[i].picture),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: state.pizzas[i].isVeg
                                        ? Colors.green
                                        : Colors.red,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 8,
                                    ),
                                    child: Text(
                                      state.pizzas[i].isVeg ? 'VEG' : 'NON-VEG',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 8,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  decoration: BoxDecoration(
                                    color: state.pizzas[i].spicy == 1
                                        ? Colors.green.withValues(alpha: 0.2)
                                        : state.pizzas[i].spicy == 2
                                        ? Colors.orange.withValues(alpha: 0.2)
                                        : Colors.red.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 8,
                                    ),
                                    child: Text(
                                      state.pizzas[i].spicy == 1
                                          ? '🌶️ BLAND'
                                          : state.pizzas[i].spicy == 2
                                          ? '🌶️ BALANCE'
                                          : '🌶️ SPICY',
                                      style: TextStyle(
                                        color: state.pizzas[i].spicy == 1
                                            ? Colors.green
                                            : state.pizzas[i].spicy == 2
                                            ? Colors.orange
                                            : Colors.red,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 8,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: Text(
                              state.pizzas[i].name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: Text(
                              state.pizzas[i].description,
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '\$${(state.pizzas[i].price - (state.pizzas[i].price * state.pizzas[i].discount / 100)).toStringAsFixed(2)}',
                                      style: TextStyle(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '\$${state.pizzas[i].price.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: Colors.grey.shade500,
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(CupertinoIcons.add_circled_solid),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is GetPizzaLoading) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Center(child: Text('An error has occurred...'));
            }
          },
        ),
      ),
    );
  }
}
