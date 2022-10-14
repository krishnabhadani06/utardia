class wishlistModel {
  int? id;
  Product? product;

  wishlistModel({this.id, this.product});

  wishlistModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (product != null) {
      data['product'] = product!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['thumbnail_image'] = thumbnailImage;
    data['base_price'] = basePrice;
    data['rating'] = rating;
    data['count'] = count;
    return data;
  }
}
