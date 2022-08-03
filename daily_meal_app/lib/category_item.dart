import 'package:daily_meal_app/category_meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return CategoryMealsScreen(id, title);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text(title, style: Theme.of(context).textTheme.titleMedium,),
        decoration:
            BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      color.withOpacity(0.7),
                      color
                    ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              borderRadius: BorderRadius.circular(20),
            ),
      ),
    );
  }
}
