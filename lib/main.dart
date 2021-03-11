import 'package:ethiofood/ui/views/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EthioFood());
}

class EthioFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

    );
  }
}

