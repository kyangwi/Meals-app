import 'package:flutter/material.dart';
import 'package:multipageapp/categories_screen.dart';

void main() {
  return runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Myapp',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: Colors.pink,
        focusColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyMedium: TextStyle(color: Color.fromRGBO(10, 51, 51, 1)),
          titleLarge: TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: CategoriesScreen(),
    );
  }
}
