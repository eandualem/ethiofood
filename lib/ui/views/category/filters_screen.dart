import 'package:ethiofood/ui/views/home/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {

  static const routeName = "/filters";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Favorites"),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text("The Favorites"),
      ),
    );
  }
}
