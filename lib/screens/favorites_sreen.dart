import 'package:flutter/material.dart';
import 'package:multipageapp/models/meal.dart';
import 'package:multipageapp/widgets/meal_item.dart';


class FavoritesSreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoritesSreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){

       return Center(
      child: Text('You have no favorite yet -start adding'),
    );
  }
  else{
    return  ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id:favoriteMeals[index].id,
            affordability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity,
            duration: favoriteMeals[index].duration,
            imageUrl: favoriteMeals[index].imageUrl,
            title: favoriteMeals[index].title,
           
          );
        },
        itemCount: favoriteMeals.length,
      );
  }
   
    
  }
}