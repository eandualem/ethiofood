import 'package:ethiofood/core/models/dummy_data.dart';
import 'package:ethiofood/ui/views/home/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20
      ),
      children: DUMMY_CATEGORIES.map((e) =>  CategoryItem(e.title, e.color)).toList(),);
  }
}
