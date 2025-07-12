import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/basket_provider.dart';

class BasketScreen extends ConsumerWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final basketItems = ref.watch(basketProvider);
    final basketNotifier = ref.read(basketProvider.notifier);
    final totalPrice = ref.watch(basketProvider.notifier).totalPrice;

    return Scaffold(
      appBar: AppBar(title: const Text('Your Basket')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: basketItems.length,
              itemBuilder: (context, index) {
                final item = basketItems[index];
                return ListTile(
                  leading: Image.network(item.product.imageUrl, width: 50),
                  title: Text(item.product.name),
                  subtitle: Text('\$${item.product.price.toStringAsFixed(2)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          if (item.quantity > 1) {
                            basketNotifier.updateQuantity(
                              item.product.id, 
                              item.quantity - 1
                            );
                          } else {
                            basketNotifier.removeFromBasket(item.product.id);
                          }
                        },
                      ),
                      Text('${item.quantity}'),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          basketNotifier.updateQuantity(
                            item.product.id, 
                            item.quantity + 1
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total:', style: Theme.of(context).textTheme.headlineSmall),
                Text('\$${totalPrice.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: basketItems.isEmpty ? null : () {
                  basketNotifier.clearBasket();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Order placed successfully!')),
                  );
                  Navigator.pop(context);
                },
                child: const Text('Checkout'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}