class CategoryList {
  List<Category> drinks;

  CategoryList({this.drinks});

  CategoryList.fromJson(Map<String, dynamic> json) {
    if (json['drinks'] != null) {
      drinks = new List<Category>();
      json['drinks'].forEach((v) {
        drinks.add(new Category.fromJson(v));
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

class Category {
  String strCategory;

  Category({this.strCategory});

  Category.fromJson(Map<String, dynamic> json) {
    strCategory = json['strCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strCategory'] = this.strCategory;
    return data;
  }
}
