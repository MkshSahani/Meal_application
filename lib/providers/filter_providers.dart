import 'package:flutter_riverpod/flutter_riverpod.dart';


enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
}

class FilterStateNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterStateNotifier() : super({
    Filter.glutenFree : false,
    Filter.lactoseFree : false,
    Filter.vegan : false,
    Filter.vegetarian : false
  });


  void setFilter(Filter filter, bool changedTo) {
    state = {
      ...state,
      filter : changedTo
    };
  }

  void setFilters(Map<Filter, bool> choosenFilter) {
    state = choosenFilter;
  }

}


final filterStateNotifierProvider = StateNotifierProvider<FilterStateNotifier,Map<Filter, bool>> ((ref) => FilterStateNotifier());