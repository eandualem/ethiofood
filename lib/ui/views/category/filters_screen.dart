import 'package:ethiofood/ui/views/home/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {

  static const routeName = "/filters";
  final Map<String, bool> filters;
  final Function saveFilters;

  FiltersScreen(this.filters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  List<Map<String, dynamic>> _userPreferences;


  @override
  initState(){
    _userPreferences = [
      {"title": "Gluten Free", "subtitle": "Only include gluten free meals", "isActive": widget.filters["gluten_free"]},
      {"title": "Vegetarian", "subtitle": "Only include vegetarian meals", "isActive":  widget.filters["vegetarian"]},
      {"title": "Vegan", "subtitle": "Only include vegan meals", "isActive":  widget.filters["vegan"]},
      {"title": "Lactose Free", "subtitle": "Only include lactose free meals", "isActive":  widget.filters["lactose_free"]},
    ];
    super.initState();
  }

  Widget _buildSwitchListTile({ String title, String subtitle, bool currentValue, Function updateValue}){
    return
      SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: currentValue,
        onChanged: updateValue
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Favorites"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              widget.saveFilters({
                "gluten_free": _userPreferences[0]["isActive"] as bool,
                "vegetarian": _userPreferences[1]["isActive"] as bool,
                "vegan": _userPreferences[2]["isActive"] as bool,
                "lactose_free": _userPreferences[3]["isActive"] as bool
              });
            }
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text("Adjust your meal selection",
                style: Theme.of(context).textTheme.headline6,
              ),

            ),
            Expanded(
              child: ListView(
                children: _userPreferences.map((pref){
                  return _buildSwitchListTile(
                      title: pref["title"],
                      subtitle: pref["subtitle"],
                      currentValue: pref["isActive"],
                      updateValue: (newValue) => setState(() => pref["isActive"] = newValue)
                  );
                }).toList(),
              )
            )
          ],
        ),
      ),
    );
  }
}
