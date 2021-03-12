import 'package:ethiofood/ui/views/category/filters_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {

  Widget _buildListTile(BuildContext context, String title, IconData icon, Function tapHandler){
    return ListTile(
      leading: Icon(icon, size: 26,),
      title: Text(title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Theme.of(context).primaryColor
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text("Ethiopian Dishes",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor
              ),

            ),
          ),
          SizedBox(height: 20),
          _buildListTile( context, 'Meals', Icons.restaurant, (){
            Navigator.of(context).pushNamed("/");
          }),
          _buildListTile( context, 'Filter', Icons.settings, (){
            Navigator.of(context).pushNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
