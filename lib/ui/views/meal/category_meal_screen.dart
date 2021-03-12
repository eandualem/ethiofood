import 'package:ethiofood/core/models/dummy_data.dart';
import 'package:ethiofood/core/models/meal.dart';
import 'package:ethiofood/ui/views/meal/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealScreen extends StatefulWidget {

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

  String categoryTitle;
  List<Meal> displayMeal;

  @override
  void didChangeDependencies() {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs["id"];
    categoryTitle = routeArgs["title"];
    displayMeal = DUMMY_MEALS.where((meal) => meal.categories.contains(categoryId)).toList();

    super.didChangeDependencies();
  }


  void removeMeal(String mealId){
    setState(() {
      displayMeal.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemCount: displayMeal.length,
        itemBuilder: (context, index){
          return MealItem(id: displayMeal[index].id, title: displayMeal[index].title, imageUrl: displayMeal[index].imageUrl, duration: displayMeal[index].duration, complexity: displayMeal[index].complexity, affordability: displayMeal[index].affordability, removeItem: removeMeal,);
        })
    );
  }

}
