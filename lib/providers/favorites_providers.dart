import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';

class FavoriteMealStateNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealStateNotifier() : super([]);

  void toogleFavoriteMeal(Meal meal) {
    bool isExisting = state.contains(meal);
    if(isExisting) {
      state = state.where((m)=> m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }

}

final favoriteMealProvider = StateNotifierProvider<FavoriteMealStateNotifier, List<Meal>>(
    (ref) => FavoriteMealStateNotifier()
);