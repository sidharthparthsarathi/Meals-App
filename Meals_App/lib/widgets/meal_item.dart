import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';
class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  //final Function removeItem;
  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    //@required this.removeItem,
  });
  void selectMeal(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
      MealDetailScreen.routeName,
    arguments: id
    )
    .then((value){
       print(value);
       if(value!=null)
       {
         //removeItem(value);
       }
    } 
    );
  }
  String get complexityText{
    switch(complexity){
      case Complexity.Simple:
       return 'Simple';
      break;//Not Needed Because You're Returning
      case Complexity.Hard:
      return 'Hard';
      break;//Not Needed Because You're Returning
      case Complexity.Challenging:
      return 'Challenging';
      break;//Not Needed Because You're Returning
      default:
      return 'UnKnown';
    }
  }
  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable:
      return 'Affordable';
      break;//Not Needed Because You're Returning
      case Affordability.Pricey:
      return 'Pricey';
      break;//Not Needed Because You're Returning
      case Affordability.Luxurious:
      return 'Expensive';
      break;//Not Needed Because You're Returning
      default:
      return 'UnKnown';
    }
  }
  @override
  Widget build(BuildContext context) {
    String min= duration==1 ? 'min' : 'mins';//Extra Added
    return InkWell(onTap: () => selectMeal(context),
          child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(10),
      elevation: 4,
      child: Column(
        children: [
          Stack(children: [
            ClipRRect(borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.network(imageUrl,height: 250,width: double.infinity,fit: BoxFit.cover,),
            ),
            Positioned(
              bottom: 20,
              right: 10,
              child: Container(
                width: 250,
                color: Colors.black38,
                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                child: Text(title,style: TextStyle(fontSize: 15,
                color: Colors.white,),
                softWrap: true,
                overflow: TextOverflow.fade,),
              ),
            ),
          ],),
          Padding(
            padding: const EdgeInsets.all(10),//By Default 8 value
            child: FittedBox(//Wrapped It Due To Large Text Overflow Problem
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Row(children: [
                  Icon(Icons.schedule),
                  SizedBox(width: 6,),
                  Text('$duration $min'),
                ],),
                Row(children: [
                  Icon(Icons.work),
                  SizedBox(width: 6,),
                  Text(complexityText),
                ],),
                Row(children: [
                  Icon(Icons.attach_money),
                  SizedBox(width: 6,),
                  Text(affordabilityText),
                ],),
              ],
              ),
            ),
          ),
        ],
      ),  
      ),
    );
  }
}