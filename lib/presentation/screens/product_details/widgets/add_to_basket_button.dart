import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/models/product_model.dart';
import '../../../../presentation/providers/basket_provider.dart';

class AddToBasketButton extends ConsumerWidget {
  final Product product;
  final int quantity;
  final VoidCallback onAdded;

  const AddToBasketButton({
    super.key,
    required this.product,
    required this.quantity,
    required this.onAdded,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          for (int i = 0; i < quantity; i++) {
            ref.read(basketProvider.notifier).addToBasket(product);
          }
          onAdded();
        },
        child: const Text('Add to Basket'),
      ),
    );
  }
}
