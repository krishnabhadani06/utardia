class wishlistModel {
  int? id;
  Product? product;

  wishlistModel({this.id, this.product});

  wishlistModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? thumbnailImage;
  int? basePrice;
  int? rating;
  int? count;

  Product(
      {this.id,
      this.name,
      this.thumbnailImage,
      this.basePrice,
      this.rating,
      this.count});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    thumbnailImage = json['thumbnail_image'];
    basePrice = json['base_price'];
    rating = json['rating'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['thumbnail_image'] = this.thumbnailImage;
    data['base_price'] = this.basePrice;
    data['rating'] = this.rating;
    data['count'] = this.count;
    return data;
  }
}
