import 'package:flutter/material.dart';
import '../../../../data/models/restaurant_model.dart';
import '../../../../data/repos/product_repo.dart';
import '../../../../data/models/product_model.dart';
import 'widgets/product_card.dart';

class ProductsScreen extends StatelessWidget {
  final Restaurant restaurant;

  const ProductsScreen({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> products = ProductRepo.getProductsForRestaurant(restaurant.name);

    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, index) => ProductCard(product: products[index]),
      ),
    );
  }
}
