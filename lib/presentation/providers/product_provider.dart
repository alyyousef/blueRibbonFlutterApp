import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/product_model.dart';
import '../../data/services/mock_product_data.dart';

final productProvider = Provider<List<Product>>((ref) {
  return MockProductData.getProducts();
});

final productsByRestaurantProvider = Provider.family<List<Product>, String>((ref, restaurantId) {
  final allProducts = ref.watch(productProvider);
  return allProducts.where((product) => product.restaurantId == restaurantId).toList();
});
