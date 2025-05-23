import 'package:flutter/material.dart';
// import 'package:multipageapp/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  

  const CategoryItem(this.id,this.title, this.color, {super.key});

  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
      '/category-meals',
      arguments:{
      'id':id,
      'title':title
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withValues(alpha: 0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(title,style: Theme.of(context).textTheme.titleMedium, ),
      
      ),
    );
  }
}



