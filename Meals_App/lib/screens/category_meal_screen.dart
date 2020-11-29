import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';
class CategoryMealScreen extends StatefulWidget {
  static const routeName='abc';
  final List<Meal> availableMeals;

  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool loadedData=false;//You Can Use Integer Also 0 and 1
  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {//It Runs Multiple Times so the data in setState is Overwritten,To Avoid This We Need To Stop That By Using Boolean/(If Statement)
    if(!loadedData)
    {
    final routeArgs=ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle=routeArgs['title'];
    final categoryId=routeArgs['id'];
    displayedMeals=widget.availableMeals.where((e){
      return e.categories.contains(categoryId);
    } //=> e.categories.contains(categoryId)//You Can Use This For Single Return
    ).toList();
    loadedData=true;
    }
    super.didChangeDependencies();
  }
  void removeItem(String mealId){
    setState(() {
          displayedMeals.removeWhere((element) => element.id==mealId);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(categoryTitle),centerTitle: true,),
          body: ListView.builder(itemBuilder: (ctx, index){
            final categoryM=displayedMeals[index];//Using Shortcut
            return MealItem(
              id: categoryM.id,//categoryMeals[index].id
              title: categoryM.title,//categoryMeals[index].title 
              imageUrl: categoryM.imageUrl,//categoryMeals[index].imageUrl 
              duration: categoryM.duration, //categoryMeals[index].duration
              complexity: categoryM.complexity, //categoryMeals[index].complexity 
              affordability: categoryM.affordability,//categoryMeals[index].affordability 
              //removeItem: removeItem,
              ); 
          },
          itemCount: displayedMeals.length
          ),
         );
  }
}