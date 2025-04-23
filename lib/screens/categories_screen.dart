import 'package:flutter/material.dart';
import 'package:multipageapp/widgets/category_item.dart';
import 'package:multipageapp/data/dummy_data.dart';
import 'package:multipageapp/widgets/appBar.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      // appBar: myAppBar('DeliMeals'),
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
                  .map((catData) => CategoryItem(catData.id, catData.title,catData.color))
                  .toList(),
        ),
      ),
    );
  }
}
