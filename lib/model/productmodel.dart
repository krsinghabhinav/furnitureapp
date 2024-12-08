class ProductModel {
  String? id;
  String? createdAt;
  String? title;
  int? price;
  String? category;
  String? image;
  String? subTitle;
  String? description;

  ProductModel(
      {this.id,
      this.createdAt,
      this.title,
      this.price,
      this.category,
      this.image,
      this.subTitle,
      this.description});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    title = json['title'];
    price = json['price'];
    category = json['category'];
    image = json['image'];
    subTitle = json['subTitle'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['title'] = this.title;
    data['price'] = this.price;
    data['category'] = this.category;
    data['image'] = this.image;
    data['subTitle'] = this.subTitle;
    data['description'] = this.description;
    return data;
  }
}
