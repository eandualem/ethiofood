import 'package:ethiofood/core/models/meal.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {

  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  String get complexityText{
    switch(complexity){
      case Complexity.Simple:
        return "Simple";
      case Complexity.Challenging:
        return "Challenging";
      case Complexity.Hard:
        return "Hard";
      default:
        throw("Undefined Complexity");
    }
  }

  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Pricey:
        return "Price";
      case Affordability.Luxurious:
        return "Luxurious";
      default:
        throw("Invalid affordability value");
    }
  }

  MealItem({
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability});

  void selectMeal(){}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(children: [
              ClipRRect(borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  width: 300,
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ],),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(children: [
                    Icon(Icons.schedule),
                    SizedBox(width: 6),
                    Text("$duration min")
                  ],),
                  Row(children: [
                    Icon(Icons.work),
                    SizedBox(width: 6),
                    Text("$complexityText")
                  ],),
                  Row(children: [
                    Icon(Icons.attach_money),
                    SizedBox(width: 6),
                    Text("$affordabilityText")
                  ],)
                ],),

            )
          ],
        ),

      ),

    );
  }
}
