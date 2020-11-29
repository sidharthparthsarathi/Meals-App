import 'package:flutter/material.dart';
import '../dummy_file.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName='/Meal-Detail';
  final Function toggleFavorite;
  final Function isFavorite;
  MealDetailScreen(this.toggleFavorite,this.isFavorite);
  Widget buildSectionTitle(BuildContext context,String text){
    return Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(text,
              style: Theme.of(context).textTheme.title,
              ),
            );
  }
  Widget buildContainer(Widget child){
    return Container(
              height: 100,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(8),
              child: child,
    );
  }
  @override
  Widget build(BuildContext context) {
    final mealId=ModalRoute.of(context).settings.arguments as String;//We Want To Use only Id So,Dont Use Map
    final selectedMeal=DUMMY_MEALS.firstWhere((element) => element.id==mealId);
    return Scaffold(appBar: AppBar(title: Text(selectedMeal.title)),//We Can Use String Intepolation Also.
          body: SingleChildScrollView(
                      child: Column(children: [
              Container(height: 241,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl,
              fit: BoxFit.cover,),
              ),
              buildSectionTitle(context, 'Ingredients'),
                buildContainer(
                  ListView.builder(itemBuilder: (ctx, index) => Card(color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5,
                    horizontal: 10,
                    ),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                  ),
                  itemCount: selectedMeal.ingredients.length,),
                ),
              buildSectionTitle(context, 'Steps'),
              buildContainer(
                ListView.builder(itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(backgroundColor: Colors.pink,child: Text('# ${(index + 1)}'),),
                      title: Text(selectedMeal.steps[index],),
                    ),
                  Divider(color: Colors.green,),
                  ],
                ),
                  itemCount: selectedMeal.steps.length,),
              ),
            ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
                child: Icon(
                  isFavorite(mealId) ? Icons.star : Icons.star_border,
                  ),
                onPressed: (){
                  //Navigator.of(context).pop(mealId);
                  toggleFavorite(mealId);
                },
                ),
    );
  }
}