import 'package:flutter/material.dart';
import 'package:multipageapp/widgets/meal_item.dart';
import 'package:multipageapp/models/meal.dart';
class CategoryMealsScreen extends StatefulWidget {
  
  static const routeName = "/category-meals";
  final  List<Meal> _availableMeals;
  const CategoryMealsScreen(this._availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  

  late String categoryTitle;
  late List<Meal> displayedMeal;
  bool _loadedInitData = false;


  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!_loadedInitData){
        final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
        final categoryId = routeArgs['id'] as String;
        displayedMeal = widget._availableMeals.where((meal) {
              return meal.categories.contains(categoryId);
            }).toList();
        _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  // void _removemeal(String mealId){
  //   setState(() {
  //     displayedMeal.removeWhere((meal)=>meal.id==mealId);
  //   });
  // }
  
  @override
  Widget build(BuildContext context) {
 
     final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['title'] as String;
    return Scaffold(
      appBar:AppBar(title: Text(categoryId),),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id:displayedMeal[index].id,
            affordability: displayedMeal[index].affordability,
            complexity: displayedMeal[index].complexity,
            duration: displayedMeal[index].duration,
            imageUrl: displayedMeal[index].imageUrl,
            title: displayedMeal[index].title,
          );
        },
        itemCount: displayedMeal.length,
      ),
    );
  }
}
