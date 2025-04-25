import 'package:flutter/material.dart';
import 'package:multipageapp/data/dummy_data.dart';
import 'package:multipageapp/screens/category_meals_screen.dart';
import 'package:multipageapp/screens/meal_details_sreen.dart';
import 'package:multipageapp/screens/tabs_screen.dart';
import 'package:multipageapp/screens/filters.dart';
import 'package:multipageapp/models/meal.dart';

void main() {
  return runApp(myApp());
}

class myApp extends StatefulWidget {
  myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> availableMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      availableMeals =
          dummyMeals.where((meal) {
            if (_filters['gluten'] == true && !meal.isGlutenFree) {
              return false;
            }
            if (_filters['lactose'] == true && !meal.isLactoseFree) {
              return false;
            }
            if (_filters['vegan'] == true && !meal.isVegan) {
              return false;
            }
            if (_filters['vegetarian'] == true && !meal.isVegetarian) {
              return false;
            }
            return true;
          }).toList();
    });
  }

  void _toggleFavorites(String mealId) {
    final existingIndex = _favoriteMeals.lastIndexWhere(
      (meal) => meal.id == mealId,
    );
    if (existingIndex >=0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(dummyMeals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Myapp',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: Colors.pink,
        focusColor: Colors.amber,
        scaffoldBackgroundColor: const Color(0xFFF8F8F8),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
          // titleTextStyle: Theme.of(context).textTheme.titleLarge,
        ),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyMedium: TextStyle(color: Color.fromRGBO(10, 51, 51, 1)),
          titleLarge: TextStyle(
            fontSize: 24,
            color: Theme.of(context).canvasColor,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: TabScreen(_favoriteMeals),
      routes: {
        CategoryMealsScreen.routeName:
            (ctx) => CategoryMealsScreen(availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorites,_isMealFavorite),
        FilterScreen.routeName: (ctx) => FilterScreen(_filters, _setFilter),
      },
    );
  }
}
