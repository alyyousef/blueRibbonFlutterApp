import 'package:flutter/material.dart';
import '../presentation/screens/auth/login_screen.dart';
import '../presentation/screens/restaurants/restaurants_screen.dart';
import '../presentation/screens/products/products_screen.dart';
import '../presentation/screens/products/product_details_screen.dart';
import '../presentation/screens/basket/basket_screen.dart';
import '../data/models/restaurant_model.dart'; // Add this import
import '../data/models/product_model.dart';    // Add this import

class AppRouter {
  // Route names as constants
  static const String login = '/';
  static const String restaurants = '/restaurants';
  static const String products = '/products';
  static const String productDetails = '/product-details';
  static const String basket = '/basket';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case restaurants:
        return MaterialPageRoute(builder: (_) => const RestaurantsScreen());
      case products:
        final restaurant = settings.arguments as Restaurant;
        return MaterialPageRoute(
          builder: (_) => ProductsScreen(restaurant: restaurant),
        );
      case productDetails:
        final product = settings.arguments as Product;
        return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(product: product),
        );
      case basket:
        return MaterialPageRoute(builder: (_) => const BasketScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  // Helper methods for type-safe navigation
  static Future<void> goToRestaurants(BuildContext context) async {
    await Navigator.pushReplacementNamed(context, restaurants);
  }

  static Future<void> goToProducts(BuildContext context, Restaurant restaurant) async {
    await Navigator.pushNamed(
      context,
      products,
      arguments: restaurant,
    );
  }

  static Future<void> goToProductDetails(BuildContext context, Product product) async {
    await Navigator.pushNamed(
      context,
      productDetails,
      arguments: product,
    );
  }

  static Future<void> goToBasket(BuildContext context) async {
    await Navigator.pushNamed(context, basket);
  }
}