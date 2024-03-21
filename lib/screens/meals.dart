import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_view.dart';
import 'package:meal_app/widgets/meals_list.dart';
import 'package:meal_app/screens/meal_details.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals, required this.onToggleFavorite});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal) onToggleFavorite;


  void _showMealDetails(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MealDetailsScreen(meal: meal, onToggleFavorite: onToggleFavorite,)));
  }

  @override 
  Widget build(BuildContext context) {

    Widget content = ListView.builder(itemBuilder: (ctx, ind) => MealItem(meal: meals[ind], showMealScreen: () {
      _showMealDetails(context, meals[ind]);
    },), itemCount: meals.length,);
    print(meals);
    if(meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Uh oh... nothin here!"),
            const SizedBox(height: 16,),
            Text("Try selecting a different category!", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground) )
          ],
        ),
      );
    }

    if(title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(title: Text(title!),),
      body: content,
    );
  }
}