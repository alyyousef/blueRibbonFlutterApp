import '../../data/models/product_model.dart';


class MockProductData {
  static List<Product> getProducts() {
    return [
      Product(
        id: 'p1',
        restaurantId: 'r1',
        name: 'Pepperoni Pizza',
        description: 'Crispy crust with spicy pepperoni and mozzarella',
        imageUrl: 'https://picsum.photos/200?10',
        price: 8.99,
      ),
      Product(
        id: 'p2',
        restaurantId: 'r1',
        name: 'Cheese Pizza',
        description: 'Classic cheese pizza with tomato sauce and mozzarella',
        imageUrl: 'https://picsum.photos/200?11',
        price: 7.99,
      ),
      Product(
        id: 'p3',
        restaurantId: 'r2',
        name: 'Classic Burger',
        description: 'Beef patty with cheese, lettuce, tomato, and pickles',
        imageUrl: 'https://picsum.photos/200?12',
        price: 9.49,
      ),
      Product(
        id: 'p4',
        restaurantId: 'r3',
        name: 'Salmon Sushi',
        description: 'Fresh salmon over seasoned rice with soy sauce',
        imageUrl: 'https://picsum.photos/200?13',
        price: 12.99,
      ),
    ];
  }
}
