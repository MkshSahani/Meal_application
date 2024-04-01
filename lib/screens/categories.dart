import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/category_grid_item.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/screens/meals.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.avilableMeals});

  final List<Meal> avilableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final List<Meal> filterMeals =  avilableMeals.where((meal) => meal.categories.contains(category.id)).toList();
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MealsScreen(title: category.title, meals:filterMeals)));
  }

  @override 
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3 / 2, crossAxisSpacing:  20, mainAxisSpacing: 20),
        children: availableCategories.map((category) => CategoryGridItem(category: category, onSeclectCategory: () {
          _selectCategory(context, category);
        },)).toList()
          // for(final category in availableCategories)
          //   CategoryGridItem(category: category)
        ,
    );
  }

}