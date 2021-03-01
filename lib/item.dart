import 'dart:core';

class Item {
  int id;
  String name;
  int price;
  String desc;
  bool inStock;

  Item({this.id, this.name, this.desc, this.price, this.inStock});

  String get availability => inStock ? "Available" : "Not available";
}
