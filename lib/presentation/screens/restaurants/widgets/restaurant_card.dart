import 'package:flutter/material.dart';
import '../../../../data/models/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final VoidCallback onTap;

  const RestaurantCard({super.key, required this.restaurant, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Image.network(
              restaurant.imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Icon(Icons.broken_image, size: 100),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(child: CircularProgressIndicator()),
                );
              },
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ListTile(
                title: Text(restaurant.name),
                subtitle: Text(restaurant.description),
                trailing: Text('⭐ ${restaurant.rating.toString()}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
