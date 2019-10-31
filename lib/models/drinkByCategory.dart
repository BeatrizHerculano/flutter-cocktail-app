class DrinkByCategoryList {
  List<DrinkByCategory> drinks;

  DrinkByCategoryList({this.drinks});

  DrinkByCategoryList.fromJson(Map<String, dynamic> json) {
    if (json['drinks'] != null) {
      drinks = new List<DrinkByCategory>();
      json['drinks'].forEach((v) {
        drinks.add(new DrinkByCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.drinks != null) {
      data['drinks'] = this.drinks.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DrinkByCategory {
  String strDrink;
  String strDrinkThumb;
  String idDrink;

  DrinkByCategory({this.strDrink, this.strDrinkThumb, this.idDrink});

  DrinkByCategory.fromJson(Map<String, dynamic> json) {
    strDrink = json['strDrink'];
    strDrinkThumb = json['strDrinkThumb'];
    idDrink = json['idDrink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strDrink'] = this.strDrink;
    data['strDrinkThumb'] = this.strDrinkThumb;
    data['idDrink'] = this.idDrink;
    return data;
  }
}
