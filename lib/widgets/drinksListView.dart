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
      children: _getListItems(),
    );
  }
}

class DrinksListViewItem extends StatelessWidget {
  DrinksListViewItem({Key key, this.drinkByCategory}) : super(key: key);

  final DrinkByCategory drinkByCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                DrinkDetailView(idDrink: drinkByCategory.idDrink)))
      },
      child: Card(
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            Image.network(
              drinkByCategory.strDrinkThumb,
              alignment: FractionalOffset.topCenter,
              fit: BoxFit.fitWidth,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              width: MediaQuery.of(context).size.width,
              child: Container(
                  color: Colors.black54,
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      drinkByCategory.strDrink,
                      style: TextStyle(
                          fontFamily: 'Calibre-Semibold',
                          fontSize: 30,
                          color: Colors.white),
                    ),
                  )),
            )
          ],
        ),
        // child:
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        semanticContainer: true,
        margin: EdgeInsets.all(10),
        elevation: 5,
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ),
    );

    // return ListTile(
    //     title: Text(),
    //     leading: Image.network(drinkByCategory.strDrinkThumb),
    //     onTap: () {
    //
  }
}
