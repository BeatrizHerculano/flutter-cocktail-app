import 'package:cocktails_app/global.dart';
import 'package:cocktails_app/models/category.dart';
import 'package:cocktails_app/view/drinks.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AppDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppDrawerState();
}

class AppDrawerState extends State<AppDrawer> {
  final _url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list';

  Future<List<Category>> _getCategoryList() async {
    var response = await http.get(_url);
    var jsonMap = json.decode(response.body);
    var categoryList = new CategoryList.fromJson(jsonMap);
    return categoryList.drinks;
  }

  @override
  void initState() {
    super.initState();
    if (Global.categories == null) {
      Global.categories = _getCategoryList();
    }
  }

  _getPageBuilder(category) {
    return PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, _, __) {
          return DrinksView(
            category: category,
          );
        },
        transitionsBuilder: (_, __, ___, Widget child) {
          return child;
        });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
      future: Global.categories,
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());

        return Drawer(
            child: ListView(
          children: snapshot.data
              .map((category) => Container(
                      child: ListTile(
                    title: Text(category.strCategory),
                    onTap: () {
                      Navigator.push(context, _getPageBuilder(category));
                    },
                  )))
              .toList(),
        ));
      },
    );
  }
}
