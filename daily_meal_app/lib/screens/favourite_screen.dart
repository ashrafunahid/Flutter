import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../widgets/meal_item.dart';
class FavouriteScreen extends StatelessWidget {

  final List<Meal> favouriteMeals;
  FavouriteScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favouriteMeals.isEmpty){
      return Center(child: Text('The Favourites'),);
    }else{
      return ListView.builder(
          itemCount: favouriteMeals.length,
          itemBuilder: (context, index){
            return MealItem(
              id: favouriteMeals[index].id,
              title: favouriteMeals[index].title,
              imageUrl: favouriteMeals[index].imageUrl,
              affordability: favouriteMeals[index].affordability,
              complexity: favouriteMeals[index].complexity,
              duration: favouriteMeals[index].duration,
            );
          }
      );
    }
  }
}
