import 'package:ethiofood/core/models/dummy_data.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {

  static String routeName = "/meal-detail";

  Widget buildSectionTitle(BuildContext context, String title){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildSectionContent(BuildContext context, {@required Widget listViewWidget}){
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 200,
        width: 300,
        child: listViewWidget
    );
  }


  @override
  Widget build(BuildContext context) {

    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((element) => element.id == mealId );
    return Scaffold(
        appBar: AppBar(
          title: Text("${selectedMeal.title} detail"),),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child:Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),

              buildSectionTitle(context, "Ingredients"),
              buildSectionContent(
                context,
                listViewWidget: ListView.builder(
                    itemCount: selectedMeal.ingredients.length,
                    itemBuilder: (context, index){
                      return Card(
                        color: Theme.of(context).accentColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10
                          ),
                          child: Text(selectedMeal.ingredients[index]),
                        ),
                      );
                    }),),
              buildSectionTitle(context, "Steps"),
              buildSectionContent(
                context,
                listViewWidget: ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (context, index){
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(child: Text("# ${index+1}"),),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        Divider()
                      ],
                    );
                  }),
              ),
            ],
          ),
        )
    );
  }
}
