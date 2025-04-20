import 'package:flutter/material.dart';
import 'package:multipageapp/widgets/appBar.dart';
import 'package:multipageapp/data/dummy_data.dart';
import 'package:multipageapp/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category-meals";

  const CategoryMealsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'] as String;
    final categoryMeals =
        dummyMeals.where((meal) {
          return meal.categories.contains(categoryId);
        }).toList();

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: myAppBar(routeArgs['title'] as String),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id:categoryMeals[index].id,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            duration: categoryMeals[index].duration,
            imageUrl: categoryMeals[index].imageUrl,
            title: categoryMeals[index].title,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
