import 'package:ethiofood/ui/views/category/categories_screen.dart';
import 'package:ethiofood/ui/views/home/tabs_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TabsScreen(),
      ),
    );
  }
}
