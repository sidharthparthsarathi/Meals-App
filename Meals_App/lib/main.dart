import './screens/meal_detail_screen.dart';
import './screens/tabs_Screen.dart';
import 'package:flutter/material.dart';
import 'screens/category_screen.dart';
import 'screens/category_meal_screen.dart';
import './screens/filters_screen.dart';
import './models/meal.dart';
import 'dummy_file.dart';

void main(List<String> args) {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> availableMeals=DUMMY_MEALS;
  List<Meal> favoriteMeals=[];
  Map<String, bool> filters={
    'Gluten': false,
    'Lactose': false,
    'Vegan': false,
    'Vegetarian': false,
  };

  void setFilters(Map<String, bool> filtersData)
  {
    setState(() {
      filters=filtersData;
      availableMeals=DUMMY_MEALS.where((element){                              //This Logic Is Same As Previous               
                     if(filters['Gluten'] && !element.isGlutenFree)           //if(filters['Gluten']==true && element.isGlutenFree==false)        //if(filters['Gluten']==true && element.isGlutenFree==true)                       
                          return false;                                       //      return false;                                             //        return true;
                     if(filters['Lactose'] && !element.isLactoseFree)         //if(filters['Lactose']==true && element.isLactoseFree==false)      //if(filters['Lactose']==true && element.isLactoseFree==true)
                          return false;                                       //      return false;                                            //         return true;
                     if(filters['Vegan'] && !element.isVegan)                 //if(filters['Vegan']==true && element.isVegan==false)              //if(filters['Vegan']==true && element.isVegan==true)
                          return false;                                       //      return false;                                            //         return true;
                     if(filters['Vegetarian'] && !element.isVegetarian)       //if(filters['Vegetarian']==true && element.isVegetarian==false)    //if(filters['Vegetarian']==true && element.isVegetarian==true)
                          return false;                                       //      return false;                                             //        return true;
                     //if(filters['Gluten']==false && filters['Lactose']==false && filters['Vegan']==false && filters['Vegetarian']==false)                                             //return true;                                                      //return false;*/ //This Logic Will Not Work Perfectly It Will Work Only For the First Time
                          //return true;
                     return true;
      }
      ).toList();
    });
  }

  void toggleFavorite(String mealId){
    final existingIndex=favoriteMeals.indexWhere((element) => element.id==mealId);
    if(existingIndex>=0)
    {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    }
    else{
      //List<Meal> e=DUMMY_MEALS.where((element) => element.id==mealId).toList();//Used For Debugging.
      //print('${e.toString()}');
      setState(() {
              favoriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id==mealId));
      });
    }

  }

  bool isFavorite(String id)
  {
    return favoriteMeals.any((element) => element.id==id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Meals App',
    theme: ThemeData(
      primarySwatch: Colors.lightGreen,
      accentColor: Colors.orange,
      canvasColor: Color.fromRGBO(255, 254, 229, 1),
      fontFamily: 'Raleway',
      textTheme: ThemeData.light().textTheme.copyWith(
        body1: TextStyle(
          color: Color.fromRGBO(20, 51, 51, 1),
        ),
        body2: TextStyle(
          color: Color.fromRGBO(20, 51, 30, 1),//I Used 30 for green
        ),
        title: TextStyle(
          fontSize: 15,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    //home: CategoryScreen(),//MyHomePage(),
    initialRoute: '/',//By Default It Is '/'
    routes: {
      '/': (ctx) => TabScreen(favoriteMeals),
      CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(availableMeals),
      MealDetailScreen.routeName: (context) => MealDetailScreen(toggleFavorite,isFavorite),
      FiltersScreen.routeName: (filter) => FiltersScreen(filters,setFilters),//Dont Use Same Name for context
    },
    onGenerateRoute: (settings){
      print(settings.arguments);
      print(settings.name);
      //if(settings.name=='/meal-detail'){
        //return ...;
      //}else if(settings.name='abc')
      //{
        //return ...;
      //}
      //return MaterialPageRoute(builder: (ctx) => CategoryScreen(),);
     //}
    },
      onUnknownRoute: (settings){
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoryScreen(),);
      },
    );
  }
}
/*class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('Meals App'),
    ),
    body: Center(child: Text('Navigation Time!'),),
    );
  }
}*/