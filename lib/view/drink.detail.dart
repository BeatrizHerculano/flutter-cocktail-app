import 'package:cocktails_app/models/drink.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DrinkDetailView extends StatelessWidget {
  DrinkDetailView({Key key, this.idDrink}) : super(key: key);
  final String idDrink;
  Future<Drink> _getDrink() async {
    var url =
        "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$idDrink";
    var response = await http.get(url);
    var responseBody = json.decode(response.body);
    DrinksList drink = DrinksList.fromJson(responseBody);
    return drink.drinks[0];
  }

  Widget _getTextFromInstuctions(String instructions) {
    var texts = instructions.split('. ');
    var widget = texts.map((text) {
      return Container(
          child: Container(
        padding: EdgeInsets.only(left: 20, right: 10),
        child: Text.rich(TextSpan(
          text: text,
          style: TextStyle(
            fontSize: 20,
          ),
        )),
      ));
    }).toList();
    return Card(
      margin: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Drink>(
      future: _getDrink(),
      builder: (context, snapshot) {
        if (snapshot.data == null)
          return Center(
            child: CircularProgressIndicator(),
          );
        return _getTextFromInstuctions(snapshot.data.strInstructions);
      },
    ));
  }
}
