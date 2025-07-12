  import '../models/restaurant_model.dart';

  class MockRestaurantData {
    static List<Restaurant> getRestaurants() {
      return [
        Restaurant(
          id: 'r1',
          name: 'Pizza Palace',
          description: 'Best pizza in town',
          imageUrl: 'https://picsum.photos/200?1',
          rating: 4.5,
        ),
        Restaurant(
          id: 'r2',
          name: 'Burger Haven',
          description: 'Juicy burgers and fries',
          imageUrl: 'https://picsum.photos/200?2',
          rating: 4.0,
        ),
        Restaurant(
          id: 'r3',
          name: 'Sushi Spot',
          description: 'Fresh and delicious sushi',
          imageUrl: 'https://picsum.photos/200?3',
          rating: 4.8,
        ),
      ];
    }
  }
