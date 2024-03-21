import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_view.dart';

class MealList extends StatelessWidget{

  const MealList({super.key, required this.mealList});

  final List<Meal> mealList;


  @override
  Widget build(BuildContext context) {

    return ListView.builder(itemBuilder: (ctx, index) => Text(mealList[index].title), itemCount: mealList.length, );
  }
}