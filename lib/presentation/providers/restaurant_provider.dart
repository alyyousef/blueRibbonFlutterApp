import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/restaurant_model.dart';
import '../../data/services/mock_restaurant_data.dart';

final restaurantProvider = Provider<List<Restaurant>>((ref) {
  return MockRestaurantData.getRestaurants();
});
