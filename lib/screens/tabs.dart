import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'package:meal_app/screens/filters.dart';

class TabsScreen extends StatefulWidget {

  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedPageIndex = 0;
  String _activePageTitle = "Categories";
  List<Meal> favoritesMealList = [];

  void _showScaffoldMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void onSelectIdentifier(String identifier) {
    Navigator.pop(context);
    if(identifier == 'filter') {
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => FiltersScreen()));
    } 
    
  }

  void toogleMealFavorite(Meal meal) {
    bool isExisting = favoritesMealList.contains(meal);
    if(isExisting) {
      setState(() {
        favoritesMealList.remove(meal);
        _showScaffoldMessage("Meal removed from favorites...");
      });
    } else {
      setState(() {
        favoritesMealList.add(meal);
        _showScaffoldMessage("Meal added to favorites...");
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

      Widget activePage = CategoriesScreen(onToggleFavorite: toogleMealFavorite,);
      if(_selectedPageIndex == 1) {
        activePage = MealsScreen(meals: favoritesMealList, onToggleFavorite: toogleMealFavorite,);
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