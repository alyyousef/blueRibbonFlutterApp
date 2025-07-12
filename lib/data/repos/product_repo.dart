import '../models/product_model.dart';
import '../models/restaurant_model.dart';

class ProductRepo {
  static List<Product> getProductsForRestaurant(String restaurantName) {
    switch (restaurantName) {
      case 'Pizza Palace':
        return [
          Product(
            id: 'p1',
            restaurantId: 'r1',
            name: 'Margherita Pizza',
            description: 'Tomato sauce, mozzarella, and basil',
            price: 80.0,
            imageUrl: 'https://i.imgur.com/4YQZ1Z0.jpg',
          ),
          Product(
            id: 'p2',
            restaurantId: 'r1',
            name: 'Pepperoni Pizza',
            description: 'Tomato sauce, mozzarella, and pepperoni',
            price: 95.0,
            imageUrl: 'https://i.imgur.com/YKdvsKa.jpg',
          ),
        ];
      case 'Burger Haven':
        return [
          Product(
            id: 'p3',
            restaurantId: 'r2',
            name: 'Classic Burger',
            description: 'Beef patty, lettuce, tomato, cheese',
            price: 70.0,
            imageUrl: 'https://i.imgur.com/lzVQ8sY.jpg',
          ),
          Product(
            id: 'p4',
            restaurantId: 'r2',
            name: 'Double Cheeseburger',
            description: 'Two beef patties, cheese, pickles',
            price: 90.0,
            imageUrl: 'https://i.imgur.com/Ik8lDkK.jpg',
          ),
        ];
      case 'Sushi Spot':
        return [
          Product(
            id: 'p5',
            restaurantId: 'r3',
            name: 'Salmon Roll',
            description: 'Fresh salmon, rice, seaweed',
            price: 110.0,
            imageUrl: 'https://i.imgur.com/X4ZwT1J.jpg',
          ),
          Product(
            id: 'p6',
            restaurantId: 'r3',
            name: 'Tuna Nigiri',
            description: 'Sliced tuna over pressed rice',
            price: 120.0,
            imageUrl: 'https://i.imgur.com/4pO7ZgK.jpg',
          ),
        ];
      default:
        return [];
    }
  }
}
