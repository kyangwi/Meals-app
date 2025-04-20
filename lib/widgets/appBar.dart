import 'package:flutter/material.dart';
class myAppBar extends StatelessWidget implements PreferredSizeWidget{
 String mytitle;
  myAppBar(this.mytitle,{super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          mytitle,
          style: TextStyle(color: Theme.of(context).canvasColor),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      );
      
  }
   @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}