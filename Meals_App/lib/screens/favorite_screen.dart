import 'package:Meals_App/models/meal.dart';
import 'package:Meals_App/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';
class FavoriteScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    if(widget.favoriteMeals.isEmpty)
    {
    return Center(
      child: Text('Favorites'),
    );
    }
    else
    {
      return ListView.builder(itemBuilder: (ctx, index)
      {
        final categoryM=widget.favoriteMeals[index];
        return MealItem(
          id: categoryM.id, 
          title: categoryM.title, 
          imageUrl: categoryM.imageUrl, 
          duration: categoryM.duration, 
          complexity: categoryM.complexity, 
          affordability: categoryM.affordability); 
          //removeItem: null);
      },
      itemCount: widget.favoriteMeals.length,
      );
    }
  }
}