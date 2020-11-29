import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isGlutenFree = false;//You Can Also Use Var Because After Initializing Dart Can Infer This

  bool isVeagan = false;//You Can Also Use Var Because After Initializing Dart Can Infer This

  bool isVegetarian = false;//You Can Also Use Var Because After Initializing Dart Can Infer This

  bool isLactoseFree = false;//You Can Also Use Var Because After Initializing Dart Can Infer This

  
  @override
  initState(){
    isGlutenFree=widget.currentFilters['Gluten'];
    isLactoseFree=widget.currentFilters['Lactose'];
    isVeagan=widget.currentFilters['Vegan'];
    isVegetarian=widget.currentFilters['Vegetarian'];
    super.initState();
  }

  Widget buildSwitchListTile(String text, String description, bool newValue, Function onPress,) {
    return SwitchListTile(
        title: Text(
            text), //For Any Widget Which Allows Us to Tap()//Imp---Dont Use The Function Directly There.
        value:
            newValue, //(Dont Use setState There)(Use setState in Build Method)
        subtitle: Text(description),
        onChanged: onPress,/*(newVal) {
          setState(() {
            newValue = newVal;
            //newValue=newValue; Dont Use Same Names
          });
        }*/
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: (){
            final selectedFilters={
              'Gluten': isGlutenFree,
              'Lactose': isLactoseFree,
              'Vegan': isVeagan,
              'Vegetarian': isVegetarian,
            };
            widget.saveFilters(selectedFilters);
          },
            ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meals Here',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile('IsGlutenFree',
                'Only Include Gluten-Free Meals',
                 isGlutenFree, 
                 (newValue)
                 {
                   setState(() {
                     isGlutenFree=newValue;
                   });
                 },),
                buildSwitchListTile('IsLactoseFree',
                'Only Include Lactose-Free Meals', 
                isLactoseFree,
                (newValue)
                 {
                   setState(() {
                     isLactoseFree=newValue;
                   });
                 },
                 ),
                buildSwitchListTile('IsVegetarian',
                'Only Include Vegetarian Meals', 
                isVegetarian,
                (newValue)
                 {
                   setState(() {
                     isVegetarian=newValue;
                   });
                 },
                 ),
                  buildSwitchListTile('IsVegan',
                  'Only Include GlutenFree Meals', 
                isVeagan,
                (newValue)
                 {
                   setState(() {
                     isVeagan=newValue;
                   });
                 },
                 ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
