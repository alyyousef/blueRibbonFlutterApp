import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/restaurant_provider.dart';
import 'widgets/restaurant_card.dart';
import '../products/products_screen.dart';
import '../basket/widgets/basket_icon.dart'; // Add this import

class RestaurantsScreen extends ConsumerWidget {
  const RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurants = ref.watch(restaurantProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurants'),
        actions: const [
          BasketIcon(), // Add the basket icon here
        ],
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];
          return RestaurantCard(
            restaurant: restaurant,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductsScreen(restaurant: restaurant),
                ),
              );
            }
          );
        },
      ),
    );
  }
}