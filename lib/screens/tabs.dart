import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/providers/meals_provider.dart';
import 'package:meal_app/providers/favorites_providers.dart';
import 'package:meal_app/providers/filter_providers.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};

class TabsScreen extends ConsumerStatefulWidget {

  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {

  int _selectedPageIndex = 0;
  String _activePageTitle = "Categories";
  List<Meal> favoritesMealList = [];
  Map<Filter, bool> selectedFilters = kInitialFilters;

  void _showScaffoldMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void onSelectIdentifier(String identifier) {
    Navigator.pop(context);
    if(identifier == 'filter') {
       Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(builder: (ctx) => FiltersScreen()));
      setState(() {
      });
    } 
    
  }




  void _selectPage(index) {
    setState(() {
      _selectedPageIndex = index;
      if(index == 0) {
        _activePageTitle = "Categories";
      } else {
        _activePageTitle = "Favorites";
      }
    });
  }

  @override 
  Widget build(BuildContext context) {
      final meals = ref.watch(mealsProvider);
      final activeFilter = ref.read(filterStateNotifierProvider);
      final List<Meal> avilableMeals = meals.where((meal) {
        if(activeFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
          return false;
        }
        if(activeFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
          return false;
        }
        if(activeFilter[Filter.vegetarian]! && !meal.isVegetarian) {
          return false;
        }
        if(activeFilter[Filter.vegan]! && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();

      Widget activePage = CategoriesScreen(avilableMeals: avilableMeals,);
      if(_selectedPageIndex == 1) {
        final favoriateMeals = ref.watch(favoriteMealProvider);
        activePage = MealsScreen(meals: favoriateMeals);
        _activePageTitle = "Favorites";
      }

      return Scaffold(
        appBar: AppBar(
          title: Text(_activePageTitle),
        ),
        drawer: MainDrawer(onSelectIdentifier: onSelectIdentifier,),
        body: activePage,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            _selectPage(index);
          },
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(icon:  Icon(Icons.set_meal), label: "Categories"),
            BottomNavigationBarItem(icon:  Icon(Icons.start), label: "Favorites")
          ],
        ),
      );
  }

}