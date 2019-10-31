import 'package:cocktails_app/models/drinkByCategory.dart';
import 'package:cocktails_app/view/drink.detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DrinksListView extends StatelessWidget {
  DrinksListView({Key key, this.drinksByCategory}) : super(key: key);
  final List<DrinkByCategory> drinksByCategory;

  List<DrinksListViewItem> _getListItems() {
    return drinksByCategory
        .map((d) => DrinksListViewItem(
              drinkByCategory: d,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 10),
      children: _getListItems(),
    );
  }
}

class DrinksListViewItem extends StatelessWidget {
  DrinksListViewItem({Key key, this.drinkByCategory}) : super(key: key);

  final DrinkByCategory drinkByCategory;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            child: ListTile(
      title: Text(drinkByCategory.strDrink),
      leading: Image.network(drinkByCategory.strDrinkThumb),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                DrinkDetailView(idDrink: drinkByCategory.idDrink)));
      },
    )));
  }
}
