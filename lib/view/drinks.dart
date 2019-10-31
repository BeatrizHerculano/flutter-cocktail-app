import 'package:cocktails_app/models/category.dart';
import 'package:cocktails_app/models/drinkByCategory.dart';
import 'package:cocktails_app/widgets/appDrawer.dart';
import 'package:cocktails_app/widgets/drinksListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DrinksView extends StatefulWidget {
  static const routeName = '/';
  DrinksView({Key key, this.category}) : super(key: key);

  final Category category;

  @override
  State<StatefulWidget> createState() => DrinksState();
}

class DrinksState extends State<DrinksView> {
  var url = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=';
  Future<List<DrinkByCategory>> _getJsonData() async {
    var urlReq = url + widget.category.strCategory;
    var response = await http.get(urlReq);
    var responseJson = convert.json.decode(response.body);
    var drinkList = DrinkByCategoryList.fromJson(responseJson);
    return drinkList.drinks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drinks'),
      ),
      body: FutureBuilder<List<DrinkByCategory>>(
          future: _getJsonData(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return DrinksListView(
              drinksByCategory: snapshot.data,
            );
          }),
      drawer: AppDrawer(),
    );
  }
}
