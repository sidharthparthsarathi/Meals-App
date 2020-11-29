import 'package:flutter/material.dart';
import '../dummy_file.dart';
import '../widgets/category_item.dart';
class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return /*Scaffold(appBar: AppBar(
      title: const Text('Daily Meals'),
    ),
          body: */GridView(padding: const EdgeInsets.all(25),
          children: DUMMY_CATEGORIES.map((cat) => CategoryItem(
            cat.id,
        cat.title,
         cat.color)).toList(), 
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,
      childAspectRatio: 3/2,//You Can Use 1.5 instead of 3/2
      crossAxisSpacing: 20,
      mainAxisSpacing: 20),);
    //);
  }
}