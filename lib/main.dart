import 'package:device_preview/device_preview.dart';
import 'package:ethiofood/core/models/dummy_data.dart';
import 'package:ethiofood/core/models/meal.dart';
import 'package:ethiofood/ui/views/category/filters_screen.dart';
import 'package:ethiofood/ui/views/detail/meal_detail_screen.dart';
import 'package:ethiofood/ui/views/home/home_page.dart';
import 'package:ethiofood/ui/views/meal/category_meal_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  DevicePreview(
    enabled: kReleaseMode,
    builder: (context) => EthioFood(), // Wrap your app
  ),
);

class EthioFood extends StatefulWidget {
  @override
  _EthioFoodState createState() => _EthioFoodState();
}

class _EthioFoodState extends State<EthioFood> {

  Map<String, bool> _filters = {
    "gluten_free": false,
    "vegetarian": false,
    "vegan": false,
    "lactose_free": false };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filtersData ){
    setState(() {
      _filters = filtersData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if(_filters["gluten_free"] && !meal.isGlutenFree) return false;
        if(_filters["vegetarian"] && !meal.isVegetarian) return false;
        if(_filters["vegan"] && !meal.isVegan) return false;
        if(_filters["lactose_free"] && !meal.isLactoseFree) return false;
        return true;
      }).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context), // Add the locale here
      builder: DevicePreview.appBuilder, // Add
      title: "EthioFood",
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',

        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          headline6: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold
          )
        )

      ),
      routes: {
        '/categories': (_) => CategoryMealScreen(_availableMeals),
        '/meal-detail': (_) => MealDetailScreen(),
        FiltersScreen.routeName: (_) => FiltersScreen(_filters, _setFilters)
      },

    );
  }
}

