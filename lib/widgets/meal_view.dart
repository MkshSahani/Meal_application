import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meal_app/models/meal.dart';

class MealItem extends StatelessWidget{

  const MealItem({super.key, required this.meal, required this.showMealScreen});

  final Meal meal;

  final void Function() showMealScreen; 

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1).toLowerCase();
  }

  String get affordiblityText {
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1).toLowerCase();
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: showMealScreen,
        child: Stack(
          children: [
            FadeInImage(placeholder: MemoryImage(kTransparentImage), image: NetworkImage(meal.imageUrl), fit : BoxFit.cover, height: 200, width: double.infinity,),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(meal.title, 
                    maxLines: 2, 
                    textAlign: TextAlign.center, 
                    softWrap: true, 
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                    ),
                    const SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(icon: Icons.schedule, label: '${meal.duration} min'),
                        // MealItemTrait(icon: icon, label: label)
                        SizedBox(width: 12,),
                        MealItemTrait(icon: Icons.work, label: '$complexityText min'),
                        SizedBox(width: 12,),
                        MealItemTrait(icon: Icons.attach_money, label: '$affordiblityText')
                      ],
                    )
                  ],
                ),
              ))
          ],
        ),
      ),
    );;
  }

}