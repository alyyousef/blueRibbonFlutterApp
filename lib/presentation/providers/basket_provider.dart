import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/product_model.dart';

// Model for individual basket items
class BasketItem {
  final Product product;
  int quantity;

  BasketItem({
    required this.product,
    this.quantity = 1,
  });

  // Helper getter for item total price
  double get totalPrice => product.price * quantity;
}

// The BasketNotifier class managing the basket state
class BasketNotifier extends StateNotifier<List<BasketItem>> {
  BasketNotifier() : super([]); // Initialize with empty basket

  // Add product to basket or increment quantity
  void addToBasket(Product product, [int quantity = 1]) {
    final existingIndex = state.indexWhere(
      (item) => item.product.id == product.id,
    );
    
    if (existingIndex >= 0) {
      // Update existing item
      state = [
        for (final item in state)
          if (item.product.id == product.id)
            BasketItem(
              product: product,
              quantity: item.quantity + quantity,
            )
          else
            item
      ];
    } else {
      // Add new item
      state = [
        ...state,
        BasketItem(product: product, quantity: quantity),
      ];
    }
  }

  // Remove item completely
  void removeFromBasket(String productId) {
    state = state.where((item) => item.product.id != productId).toList();
  }

  // Update specific item's quantity
  void updateQuantity(String productId, int newQuantity) {
    state = [
      for (final item in state)
        if (item.product.id == productId)
          BasketItem(
            product: item.product,
            quantity: newQuantity,
          )
        else
          item
    ];
  }

  // Empty the basket
  void clearBasket() {
    state = [];
  }

  // Calculate total basket price
  double get totalPrice {
    return state.fold(
      0,
      (total, item) => total + item.totalPrice,
    );
  }

  // Count total items in basket
  int get itemCount {
    return state.fold(
      0,
      (count, item) => count + item.quantity,
    );
  }
}

// The provider exposing BasketNotifier
final basketProvider = StateNotifierProvider<BasketNotifier, List<BasketItem>>(
  (ref) => BasketNotifier(),
);

// Helper provider for total price
final basketTotalProvider = Provider<double>(
  (ref) => ref.watch(basketProvider.notifier).totalPrice,
);

// Helper provider for item count
final basketItemCountProvider = Provider<int>(
  (ref) => ref.watch(basketProvider.notifier).itemCount,
);