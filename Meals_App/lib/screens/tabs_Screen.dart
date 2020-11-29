import 'package:Meals_App/screens/favorite_screen.dart';
import 'package:flutter/material.dart';
import './category_screen.dart';
import './favorite_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';
class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabScreen(this.favoriteMeals);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPagesIndex=0;

  @override
  void initState() {
    _pages=[
  {
    'page': CategoryScreen(),
    'title': 'Categories'
    },
  {
    'page': FavoriteScreen(widget.favoriteMeals),
    'title': 'Your Favorites'
    },
  ];
    super.initState();
  }


  void selectedPages(int page){
    setState(() {
      _selectedPagesIndex=page;
    });
  }
  @override
  Widget build(BuildContext context) {
    return /*DefaultTabController(length: 2,//Commented Out For Another Approach bottomNavigationBar
    initialIndex: 0,
          child: */Scaffold(appBar: AppBar(title: Text(_pages[_selectedPagesIndex]['title'],)
          /*bottom: TabBar(
            tabs: [
            Tab(icon: Icon(Icons.category),text: 'Categories',),
            Tab(icon: Icon(Icons.star),text: 'Favorites',),
          ],),*///Commented Out For Another Approach bottomNavigationBar
      ),
      drawer: MainDrawer(),//Drawer(child: Text('The Drawer!'),),
      body: _pages[_selectedPagesIndex]['page'],/*TabBarView(children: [//Commented Out For Another Approach bottomNavigationBar
        CategoryScreen(),
        FavoriteScreen(),
      ]),
          ),*/
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectedPages,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.red,//Theme.of(context).accentColor,
        currentIndex: _selectedPagesIndex,
        //type: BottomNavigationBarType.shifting,//You Can Use This
        //type: BottomNavigationBarType.fixed,//Default
        items: [
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(Icons.category),title: Text('Categories'),),
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(Icons.star),title: Text('Favorites'),),
      ],
      ),
    );
  }
}