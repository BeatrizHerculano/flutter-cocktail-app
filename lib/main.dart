import 'package:cocktails_app/models/category.dart';
import 'package:cocktails_app/view/drinks.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      routes: {
        '/': (context) => DrinksView(
              category: new Category(strCategory: 'Ordinary Drink'),
            ),
      },
    );
  }
}
