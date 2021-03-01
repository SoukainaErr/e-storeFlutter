class Product {
  int id;
  String name;
  String description;
  int price;
  String taille;
  String urlImg;

  Product(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.taille,
      this.urlImg});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    price = json['price'];
    taille = json['taille'];
    urlImg = json['urlImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['taille'] = this.taille;
    data['urlImg'] = this.urlImg;
    return data;
  }
}
