import 'package:ethiofood/ui/views/category/categories_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EthioFood"),
      ),
      body: Center(
        child: CategoriesScreen(),
      ),
    );
  }
}
