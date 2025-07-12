import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/basket_provider.dart';  // Fixed import path

class BasketIcon extends ConsumerWidget {
  const BasketIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemCount = ref.watch(
      basketProvider.select((basket) => basket.fold(0, (sum, item) => sum + item.quantity)),
    );
    
    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.shopping_basket),
          onPressed: () {
            Navigator.pushNamed(context, '/basket');
          },
        ),
        if (itemCount > 0)
          Positioned(
            right: 8,
            top: 8,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.red,
              child: Text(
                itemCount.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
      ],
    );
  }
}