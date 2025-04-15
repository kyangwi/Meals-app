import 'package:flutter/material.dart';
import 'package:multipageapp/category_item.dart';
import 'package:multipageapp/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: Text(
          'DeliMeals',
          style: TextStyle(color: Theme.of(context).canvasColor),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          children:
              availableCategories
                  .map((catData) => CategoryItem(catData.title, catData.color))
                  .toList(),
        ),
      ),
    );
  }
}
